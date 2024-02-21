# Because the user add products into the cart, the application will need to keep track of all the items added to the cart by the buyer. To do that, we'll keep a cart in the database and store its unique identifier, cart.id, in the session. Every time a request comes in, we can recover that identifier from the session and use it to find the cart in the database.

# Rails make the current session look like a hash to the controller, so we'll store the ID of the cart in the session by indexing it with the :cart_id symbol.

module CurrentCart

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end

# The set_cart method starts by getting the :cart_id from the session object and then attempts to find a cart corresponding to this ID. If such a cart record isn't found (which will happen if the ID is nil of invalid for any reason), this method will proceed a new Cart and then store the ID of the created cart into the session.

# Note that we place the set_cart method in a CurrentCart module and place that module in a new file in the app/controllers/concerns directory. This treatment allows us to share common code among controllers.

# We mark the method as private, which prevents Rails from ever making it available as an action on the controller.