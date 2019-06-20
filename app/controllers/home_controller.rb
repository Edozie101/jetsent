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
        session[:referrer] = params["referrer"]
        if session[:referrer] and session[:referrer] != session[:subscriber]
            @referrer = Subscriber.find(session[:referrer])
            flash[:notice] =  "Hello newcomer your friend #{@referrer.name} added you ! "
        elsif session[:subscriber]
            flash[:notice] = "Welcome back #{Subscriber.find(session[:subscriber]).name}, invite some friends here and earn $10 per person!"
        else
            
        end

    end


    private

    def permitted_params

        params.permit(:referrer)

    end

end
