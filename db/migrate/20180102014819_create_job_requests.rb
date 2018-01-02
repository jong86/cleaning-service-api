class CreateJobRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :job_requests do |t|
      t.string :address
      t.string :possible_times
      t.string :description
      t.integer :client_id # FK

      t.timestamps
    end
  end
end
