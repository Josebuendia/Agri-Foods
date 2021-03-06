class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  def user_params
        #   params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :role, 
        #     :farm_name, :farmers_picture, :about_farm, :farm_type, :county)
        #  end
    
     has_many :orders
     has_many :item
    #image attachment
     has_one_attached :avatar


end
