class CartController < ApplicationController
  before_action :authenticate_user!
  def remove

    id = params[:id]
    cart = session[:cart]
    cart.delete id

    redirect_to :root
  end

  def decrease

    id = params[:id]
    cart = session[:cart]
    if cart[id] == 1 then
        cart.delete id
    else
     cart[id] = cart[id] - 1
    end
     #takes us to cart index[view] page
    redirect_to :action => :index

  end


  def clearCart
    #this sets session variable to nil and brings user back to index
    session[:cart] = nil
    redirect_to :action => :index
  end

  def add
    # this gets the Id of the product
    id = params[:id]

    # where the cart is already been created, use the existing cart else create a blank cart
  if session[:cart] then
    cart = session[:cart]
  else
    session[:cart] = {}
    cart = session[:cart]
  end
  #In the case where the product is has already been added it increments by 1 
  #else product is set to 1
  if cart[id] then
    cart[id] = cart[id] + 1
  else
    cart[id]= 1
  end

    redirect_to :action => :index

  end
  def index
    # passes a cart to display
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

  def createOrder
   @user = User.find(current_user.id)

   @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
   @order.save

   @cart = session[:cart] || {} # Get the contents of the Cart
   @cart.each do | id, quantity |
      item = Item.find_by_id(id)
      @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price=> item.price)
    @orderitem.save
  end
   @orders = Order.last
   @orderitems = Orderitem.where(order_id: Order.last)
   session[:cart] = nil


  end


end