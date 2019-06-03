class TravelController < ApplicationController


def index
  if params[:destination]
    @destination =  params[:destination]
  else
    @destination = ""
  end
end


  def show

  end

end
