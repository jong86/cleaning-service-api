class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.datetime :confirmed_time
      t.datetime :time_work_started
      t.datetime :time_work_completed
      t.boolean :is_paid
      t.integer :employee_id # FK
      t.integer :job_request_id # FK

      t.timestamps
    end
  end
end
