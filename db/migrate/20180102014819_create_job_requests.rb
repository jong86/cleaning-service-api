class CreateJobRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :job_requests do |t|
      t.integer :client_id # FK
      t.string :address
      t.string :possible_times
      t.string :work_description
      t.decimal :quantity_hours
      t.boolean :interview_requested
      t.string :possible_interview_times
      t.string :interview_notes
      t.string :guest_first_name
      t.string :guest_last_name
      t.string :guest_phone_number
      t.string :guest_email

      t.timestamps
    end
  end
end
