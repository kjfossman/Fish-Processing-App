class AddColumnInvoiceIdToFishTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :fish_tickets, :invoice_id, :integer
  end
end
