class Order < ApplicationRecord
  belongs_to :mechanic
  has_many :orders_services, dependent: :destroy
  has_many :services, through: :orders_services

  validates :customer, presence: true
end
