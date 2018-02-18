class AddUuidToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :uuid, :uuid, default: 'gen_random_uuid()'
  end
end
