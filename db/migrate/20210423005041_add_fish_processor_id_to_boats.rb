class AddFishProcessorIdToBoats < ActiveRecord::Migration[6.1]
  def change
    add_column :boats, :fish_processor_id, :integer
  end
end
