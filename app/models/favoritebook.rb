class Favoritebook < ApplicationRecord
  belongs_to :User
  belongs_to :Book
end
