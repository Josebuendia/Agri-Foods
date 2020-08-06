class Item < ApplicationRecord
    #belongs_to :user, :optional => true
    # TODO check if :option => true is the optimal solution to 'user does  not exist problem' Fixed
    belongs_to :user

    #image attachment
    has_one_attached :image

end
