class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :employee_id # FK
      t.datetime :confirmed_time
      t.datetime :time_work_started
      t.datetime :time_work_completed
      t.boolean :bill_sent, default: false
      t.boolean :is_paid, default: false
      t.text :admin_notes
      t.text :employee_notes
      # For jobs that didn't come from an online job request
      t.string :address
      t.text :description
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
