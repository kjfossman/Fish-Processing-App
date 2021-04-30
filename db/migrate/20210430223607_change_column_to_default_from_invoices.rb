class ChangeColumnToDefaultFromInvoices < ActiveRecord::Migration[6.1]
  def change
    change_column :invoices, :chum_price, :float, :default => 0.50
    change_column :invoices, :sockeye_price, :float, :default => 1.45
    change_column :invoices, :coho_price, :float, :default => 1.10
    change_column :invoices, :humpy_price, :float, :default => 0.15
    change_column :invoices, :king_price, :float, :default => 3.75
  end
end
