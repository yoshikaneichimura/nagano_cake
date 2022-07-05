class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def active_for_authentication?
    super && (is_active == true)
  end
         
  has_many :orders,dependent: :destroy
  has_many :addresses,dependent: :destroy
  
end