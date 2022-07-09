class Order < ApplicationRecord
  belongs_to :mechanic
  has_many :orders_services, dependent: :destroy
  has_many :services, through: :orders_services

  validates :customer, presence: true

  scope :filter_by_customer, -> { order(:customer) }
  scope :filter_by_desc, -> { order(created_at: :desc) }
  scope :filter_by_asc, -> { order(created_at: :asc) }
  scope :filter_by_status_active, -> { where(status: true) }
  scope :filter_by_status_done, -> { where(status: false) }

  def self.search_by_mechanic(search)
    where("mechanic_id = ?", search)
  end

  def self.search_by_category(search)
    category = Category.where("id = ?", search)
    category[0].services.map { |s| return s.orders }
  end

  def unique_categories(services)
    services.map { |s| s.category.name }.uniq
  end
end
