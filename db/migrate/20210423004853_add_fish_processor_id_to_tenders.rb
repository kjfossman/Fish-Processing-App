class AddFishProcessorIdToTenders < ActiveRecord::Migration[6.1]
  def change
    add_column :tenders, :fish_processor_id, :integer
  end
end
