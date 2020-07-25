class Order < ApplicationRecord
  belongs_to :user
  def order_params
    params.require(:order).permit( :order_date, :user_id, :status)
  end

#:dependent => :destroy <--put this in to deal with ActiveRecord::InvalidForeignKey: 
#SQLite3::ConstraintException: FOREIGN KEY constraint failed
  has_many :orderitems, :dependent => :destroy
  belongs_to :user

end
