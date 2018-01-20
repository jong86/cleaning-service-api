class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :employee_id # FK
      t.integer :job_request_id # FK
      t.datetime :confirmed_time
      t.datetime :time_work_started
      t.datetime :time_work_completed
      t.boolean :is_paid
      t.text :admin_notes
      t.text :employee_notes

      t.timestamps
    end
  end
end
