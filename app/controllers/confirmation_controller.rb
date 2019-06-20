class ConfirmationsController < ApplicationController
    before_action :find_conf, only: [:destroy,:accept]


    def create
        @confirmation = Confirmation.new(permitted_params)
        @confirmation.user_id = current_user.id
        if @confirmation.save()
            respond_to do |f|
                f.html{ redirect_to orders_url(@confirmation.order), notice: "Congratulations"}
           end
       end
    end



    def accept
        @order = @confirmation.order
        if current_user.id == @confirmation.order.user_id
            @order.traveller_id = @confirmation.user_id
            @order.price = @confirmation.price
            @order.currency = @confirmation.currency
        end

    end


    private

    def find_conf
        @confirmation = Confirmation.find(params['id'])
    end

    def permitted_params

        params.require(:confirmation).permit(:price,:user_id,:order_id,:currency)


    end
end
