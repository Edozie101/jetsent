class OrdersController < ApplicationController
    require 'mechanize'
    before_action :set_params, only: [:show,:edit,:destroy]

    def index
        @order = Order.new()
    end

    def create
        agent = Mechanize.new
        link = params[:order][:website]
        puts link
        site = agent.get(link)
        images = site.search("img")
        title = site.search("h1").text
        @order = Order.new()
        @order.name = title
        @order.website = link
        @order.image = images[0].attr('src')
        prices = site.search("span").select { |e| e.text.match(/Â£/)  }
        if prices.nil?
            prices = site.search("div").select { |e| e.text.match(/Â[£|$]/)  }
            prices.nil? ? prices = [" "] : prices = prices

        end
        @order.price = prices[0].text

        puts "#{@order.price} is the price"
        respond_to do |format|
            if @order.save
                format.html{redirect_to edit_order_url}
            end
        end


    end

    def edit
        @order

    end


    private

    def set_params
        @order = Order.find(params[:id])
    end

    def permit_through
        params.require(:order).permit(:name,:website,:image, :pickup_location, :drop_off_location)
    end





end
