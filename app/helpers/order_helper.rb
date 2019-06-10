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
end
