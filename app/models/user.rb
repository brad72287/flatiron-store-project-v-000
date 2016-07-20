class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :carts 
  
  def current_cart
    if carts.empty? 
      current_cart = Cart.create(user: self)
    else
      return nil if carts.last.status == 'nilcart'
      carts.last
    end
  end
  
  def current_cart=(cart)
    #@cart = cart
    carts << cart unless cart.nil?
    carts.last.update(status: 'nilcart') if cart.nil? && !carts.empty?
  end
end
