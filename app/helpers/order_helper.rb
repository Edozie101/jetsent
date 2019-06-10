module OrderHelper

	def order_status(confirmed)
		if confirmed == "unconfirmed"
			content_tag :span, "#{confirmed.capitalize}", class:"badge badge-secondary"
		elsif confirmed == "on_display"
			content_tag :span, "#{confirmed.capitalize}", class: "badge badge-warning"
		elsif confirmed == "confirmed"
			content_tag :span, "#{confirmed.capitalize}", class: "badge badge-success"
		else
			content_tag :span, "#{confirmed.capitalize}", class: "badge badge-dark"
		end
	end

	def guest_status(guest)
		if guest
			content_tag :span, "Guest", class: "badge badge-light"
		else
			content_tag :span, "#{current_or_guest_user.email}", class: "badge badge-dark"
		end
	end
end
