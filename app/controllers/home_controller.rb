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
        respond_to do |format|
            if link
                format.html { redirect_to :show_item, notice: 'We have successfully found your Product' }
            end
        end

    end

    def show_item


    end
    def item

    end

    private

end
