class CreateCustomerShippingAddresses < ActiveRecord::Migration
  def change
    create_table :customer_shipping_addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.timestamps null: false
    end
  end
end
