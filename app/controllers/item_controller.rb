class ItemController < ApplicationController
    before_action :set_item, only:  [:show, :edit]
    analytical
    require 'mechanize'
    reg = /(kr|$|£|€)/



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
        prices = site.search("span").select { |e| e.text.match(/Â£/)  }
        if prices.nil?
            prices = site.search("div").select { |e| e.text.match(/Â[£|$]/)  }
            prices.nil? ? prices = [" "] : prices = prices

        end
        puts prices
        @item.price = prices[0].text
        @item.save()
        respond_to do |format|
            if @item.save()
                format.html { redirect_to @item, notice: 'We have successfully found your Product' }
                format.json { render :show, status: :created, location: @item }

            end
        end

    end

    def show

    end

    def edit

    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end


end
