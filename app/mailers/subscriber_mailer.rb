class SubscriberMailer < ApplicationMailer
	default from: 'edzye101@gmail.com'

	def welcome_email
		@subscriber = params[:subscriber]
		 email_with_name = %("#{@subscriber.name}" <#{@subscriber.email}>)
		
		@url = "https://serene-fjord-30022.herokuapp.com"
		mail(to: email_with_name, subject: "Thank you for signing up to Jetsent!")
	end

end
