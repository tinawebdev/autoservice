class Order < ApplicationRecord
  belongs_to :mechanic

  validates :customer, presence: true
end
