class SubscribersController < ApplicationController
	require 'twilio-ruby'
	def create

		@subscriber = Subscriber.new(permitted_par)
		if session[:referrer] and Subscriber.find(session[:referrer])
			@subscriber.referrer_id = session[:referrer]
		end
		@twilio = Twilio::REST::Client.new(ENV['twilio_account_sid_live'],ENV['twilio_auth_token_live'])
		@num = ENV["twilio_number"]

		respond_to do |format|
			if @subscriber.save
				 if session[:subscriber_id] == nil ; session[:subscriber_id] = @subscriber.id  end
				SubscriberMailer.with(subscriber: @subscriber).welcome_email.deliver_later
				if @subscriber.referrer_id
					@twilio.api.account.messages.create(from: @num, to: @subscriber.phone, body: " #{@subscriber.name}, Congratulations for signing up to Jetsent, we will keep you update with all JetSent related progress , make sure you thank #{@subscriber.referrer.name} for your discount!")
				else
					@twilio.api.account.messages.create(from: @num, to: @subscriber.phone, body: " #{@subscriber.name}, Congratulations for signing up to Jetsent, we will keep you update with all JetSent related progress")
				end
				format.html {redirect_to subscribe_url, notice: "Congratulations for signing up early"}
				format.json {render json: @subscriber, status: :created, location: @subscriber}
			else
				format.html {redirect_to subscribe_url, notice: "something is wrong here :/"}
			end


		end
	end

	def create_referrers

		@subscriber  = session[:subscriber_id]

		if params[:referrer_1]
			@referrer = params[:referrer_1]
		end
		if params[:referrer_2]
			@referrer_2 = params[:referrer_2]
		end
		if params[:referrer_3]
			@referrer_3 = params[:referrer_3]
		end

		SubscriberMailer.with(subscriber: @subscriber,referrer_1: @referrer,referrer_2: @referrer_2,referrer_3: @referrer_3).referrer_email.deliver_now
		puts params.to_unsafe_h
		puts params.to_unsafe_h.length
		num = params.to_unsafe_h.length - 5
		if num >1
			@res = "those #{num} people"
		else
			@res = "that person"
		end
		respond_to do |format|
			format.html{redirect_to subscribe_url, notice: "Thanks for signing up #{@res}"}
		end








	end
	private

	def permitted_par

		params.require(:subscriber).permit(:name,:email,:phone,:referrer_id,:state)

	end

end
