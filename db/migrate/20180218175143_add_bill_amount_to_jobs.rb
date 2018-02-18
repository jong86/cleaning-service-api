class AddBillAmountToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :bill_amount, :money
  end
end
