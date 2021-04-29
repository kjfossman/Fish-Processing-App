class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :boat_id
      t.float :chum_price
      t.float :sockeye_price
      t.float :coho_price
      t.float :humpy_price
      t.float :king_price
      t.datetime :date
      t.boolean :paid
      t.timestamps
    end
  end
end
