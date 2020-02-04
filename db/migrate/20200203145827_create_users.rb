class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :email

      t.timestamps
    end

    add_index :users, :cpf, unique: true
  end
end
