class AddStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :status, :boolean, default: true
  end
end
