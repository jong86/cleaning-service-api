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

      t.timestamps
    end
  end
end
