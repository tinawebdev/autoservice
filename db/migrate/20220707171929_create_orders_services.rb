class CreateOrdersServices < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_services do |t|
      t.references :order, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
