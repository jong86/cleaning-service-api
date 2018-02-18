class AddNameToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :customer_first_name, :string
    add_column :jobs, :customer_last_name, :string
  end
end
