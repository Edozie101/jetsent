class SubscriberMailer < ApplicationMailer
	default from: 'edzye101@gmail.com'

	def welcome_email
		@subscriber = params[:subscriber]
		 email_with_name = %("#{@subscriber.name}" <#{@subscriber.email}>)
		@url = "https://serene-fjord-30022.herokuapp.com"
		mail(to: email_with_name, subject: "Thank you for signing up to Jetsent!")
	end


	def referrer_email
		@subscriber = Subscriber.find(params[:subscriber])
		puts "#{@subscriber.name } is your name"
		begin
			@url = "https://localhost:3000/?referrer=#{@subscriber.id}"
		rescue
			# puts "no id ;"
		end

		if params[:referrer_1]
			@referrer = params[:referrer_1]
			puts   "#{@referrer} is referrer_1"

			mail(to: "#{@referrer}", subject: " #{@subscriber.name} told us you'd enjoy JetSent")
			puts  "mailing done 1"
		end

		if params[:referrer_2]
			@referrer_2 = params[:referrer_2]
			puts   "#{@referrer_2} is referrer_2"

			mail(to: "#{@referrer_2}", subject: " #{@subscriber.name} told us you'd enjoy JetSent")
			puts  "mailing done 2"

		end

		if params[:referrer_3]
			@referrer_3 = params[:referrer_3]
			puts   "#{@referrer_3} is referrer_3"

			mail(to: "#{@referrer_3}", subject: " #{@subscriber.name} told us you'd enjoy JetSent")
			puts  "mailing done 3"

		end
	end

end
