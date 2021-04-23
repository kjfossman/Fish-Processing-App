class AddFishProcessorIdToFishTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :fish_tickets, :fish_processor_id, :integer
  end
end
