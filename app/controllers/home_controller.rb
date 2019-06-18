class HomeController < ApplicationController
    analytical
    require 'mechanize'

    def index

    end


    def search
        agent = Mechanize.new
        link = params[:link]
        puts link
        site = agent.get(link)
        images = site.search("img")
        title = site.search("h1").text
        @item = Item.new()
        @item.name = title
        @item.website = link
        @item.image = images[0].attr('src')
        @item.save()
        respond_to do |format|
            if @item.save()
                format.html { redirect_to item_path(@item), notice: 'We have successfully found your Product' }
            end
        end

    end

    def item

    end

    def subscription
        @subscriber = Subscriber.new

    end


    private

end
