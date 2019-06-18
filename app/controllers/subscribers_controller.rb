class SubscribersController < ApplicationController
	require 'twilio-ruby'
	def create
		@subscriber = Subscriber.new(permitted_par)
		@twilio = Twilio::REST::Client.new(ENV['twilio_account_sid_live'],ENV['twilio_auth_token_live'])
		@num = ENV["twilio_number"]

		respond_to do |format|
			if @subscriber.save
				SubscriberMailer.with(subscriber: @subscriber).welcome_email.deliver_later
				@twilio.api.account.messages.create(from: @num, to: @subscriber.phone, body: "#{@subscriber.name}, Congratulations for signing up to Jetsent, we will keep you update with all JetSent related progress")
				format.html {redirect_to subscribe_url, notice: "Congratulations for signing up early"}
				format.json {render json: @subscriber, status: :created, location: @subscriber}
			else
				format.html {redirect_to subscribe_url, notice: "something is wrong here :/"}
				
			end


		end
	end
	private

	def permitted_par

		params.require(:subscriber).permit(:name,:email,:phone,:state)

	end

end
