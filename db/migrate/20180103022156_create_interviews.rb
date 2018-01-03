class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.integer :job_request_id # FK
      t.string :time
      t.string :address
      t.string :notes

      t.timestamps
    end
  end
end
