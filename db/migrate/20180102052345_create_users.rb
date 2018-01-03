class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :type # Client, Employee, or Admin
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :address
      t.string :availability
      t.string :info

      t.timestamps
    end
  end
end
