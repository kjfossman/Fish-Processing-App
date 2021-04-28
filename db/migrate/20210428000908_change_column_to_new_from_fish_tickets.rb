class ChangeColumnToNewFromFishTickets < ActiveRecord::Migration[6.1]
  def change
    change_column :fish_tickets, :chum_pounds, :integer, :default => 0
  end
end
