class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :carts 
  
  def current_cart
    #return nil if carts.last.status == 'submitted'
    if carts.empty? 
      current_cart = Cart.create(user: self)
    else
      carts.last
    end
  end
  
  def current_cart=(cart)
    #@cart = cart
    carts << cart unless cart.nil?
  end
end
