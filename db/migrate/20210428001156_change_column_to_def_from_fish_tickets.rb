class ChangeColumnToDefFromFishTickets < ActiveRecord::Migration[6.1]
  def change
    change_column :fish_tickets, :sockeye_pounds, :integer, :default => 0
    change_column :fish_tickets, :coho_pounds, :integer, :default => 0
    change_column :fish_tickets, :humpy_pounds, :integer, :default => 0
    change_column :fish_tickets, :king_pounds, :integer, :default => 0
  end
end
