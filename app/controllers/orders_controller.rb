class OrdersController < ApplicationController
    require 'mechanize'
    require 'nokogiri'
    require 'selenium-webdriver'

    before_action :set_params, only: [:show,:edit,:destroy]



    def index
        @order = Order.new()
        puts @order.methods
    end
    def new
        @order = Order.new()
    end

    def create
        link = params[:order][:website]

        @order = Order.new(permit_through)
        @order.website.nil? ? @order.website = link : @order.website = link
        if current_user
            @order.user_id = current_user.id
        else
            @order.user_id = "N/A"
        end

        if(link.match(/amazon/))
            options = Selenium::WebDriver::Chrome::Options.new
            options.add_argument('--headless')
            @driver = Selenium::WebDriver.for :chrome, options: options
            @driver.navigate.to link
            @order.name = @driver.find_elements(css: "h1")[0].text
            @order.image = @driver.find_elements(css: "img.a-dynamic-image")[0].attribute("src")
            prices = @driver.find_elements(css: "span.a-color-price")
            @order.price = p2[0].text

        elsif(link.match(/facebook/))
            @driver.manage.window.resize_to(800,800)
            @driver.save_screenshot("/app/assets/screenshots/" + link + ".jpg")

        else
            agent = Mechanize.new
            doc = Nokogiri::HTML(open(link))
            site = agent.get(link)
            image = doc.xpath('//meta[@property="og:image"]/@content').first.value
            prices = site.search("span").select { |e| e.text.match(/£|$/)  }
            title = site.search("h1").text

            @order.name.nil? ? @order.name =  title : @order.name = "Item name not found"
            @order.image = image
            if !image.match(/http/)
                image = "https:" + image
                puts "image"
            end
            if prices[0].nil?
                # are there prices on the website divs
                prices = site.search("div").select { |e| e.text.match(/Â[£|$]/)  }
                prices[0].nil? ? @order.price = " Not Found " : prices = prices
            end
            if !@order.price
                @order.price = prices[0].text
            end


        end



        #
        # are there prices on the website sppans

        if @order.user_id != "N/A"
            @order.save!
            respond_to do |format|
                    format.html { redirect_to @order }
            end

        else

            respond_to do |format|
                    format.html { redirect_to new_order_url(@order) }
            end
        end


    end

    def edit


    end

    def update


    end


    private

    def set_params
        @order = Order.find(params[:id])
    end

    def permit_through
        params.require(:order).permit(:name,:website,:image, :pickup_location, :drop_off_location)
    end





end
