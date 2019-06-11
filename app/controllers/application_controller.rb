class ApplicationController < ActionController::Base
    analytical
    protect_from_forgery

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.

  def create_guest_user
    u = User.new(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com", :guest => true)
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

  def logging_in
        #convert orders
        begin
            @orders = Order.where(user_id: guest_user.id)
            for order in @orders
                order.update(user_id: current_user.id)
            end
            puts "all done with the orders :)"

        rescue
            puts "orders failed to convert"

        end

        #convert Trips

        begin
            @trips = Trip.where(user_id: guest_user.id)
            for trip in @trips
                trip.update(user_id: current_user.id)
            end
            puts "all done with the trips :)"
        rescue
            puts "Trips failed to convert"

        end
    end
end
