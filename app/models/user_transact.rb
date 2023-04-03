class UserTransact < ApplicationRecord
belongs_to :product
belongs_to :user
has_one :destination
end
