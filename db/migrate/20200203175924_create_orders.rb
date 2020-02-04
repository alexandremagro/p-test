class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :phone_model
      t.string :phone_imei
      t.float :installment_amount
      t.integer :number_of_installments
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :orders, :phone_imei, unique: true
  end
end
