class Service < ApplicationRecord
  belongs_to :category
  has_many :orders_services, dependent: :destroy
  has_many :orders, through: :orders_services

  validates :title, presence: true
end
