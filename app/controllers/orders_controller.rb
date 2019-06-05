class OrdersController < ApplicationController
    require 'mechanize'
    before_action :set_params, only: [:show,:edit,:destroy]



    def index
        @order = Order.new()
        puts @order.methods
    end
    def new
        @order = Order.new()
    end

    def create
        agent = Mechanize.new
        link = params[:order][:website]
        puts link
        site = agent.get(link)
        puts " #{site}"

        images = site.search("img")
        title = site.search("h1").text
        @order = Order.new(permit_through)
        @order.name.nil? ? @order.name =  title : @order.name = "Item name not found"
        @order.website.nil? ? @order.website = link : @order.website = link
        @order.image.nil? ? @order.image = images[0].attr('src') : @order.image = "image link"
        @order.user_id = current_user.id
        prices = site.search("span").select { |e| e.text.match(/Â£/)  }
        # are there prices on the website sppans
        if prices[0].nil?
            puts "prices :  pre nil #{prices}"
            # are there prices on the website divs
            prices = site.search("div").select { |e| e.text.match(/Â[£|$]/)  }
            prices[0].nil? ? @order.price = " Not Found " : prices = prices

            puts "prices :  post nil #{prices}"

        end
        if !@order.price
            @order.price = prices[0].text
        end

        puts "#{@order.price} is the price"
        if @order.save!
            puts "SAVVE"
            respond_to do |format|
                    format.html { redirect_to @order }
            end
        else
            puts "did not save"


            respond_to do |format|
                    format.html { redirect_to new_order_url }
            end
        end


    end

    def edit


    end


    private

    def set_params
        @order = Order.find(params[:id])
    end

    def permit_through
        params.require(:order).permit(:name,:website,:image, :pickup_location, :drop_off_location)
    end





end
