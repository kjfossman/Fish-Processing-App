class CreateFishTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :fish_tickets do |t|
      t.integer :tender_id
      t.integer :boat_id
      t.integer :chum_pounds
      t.integer :sockeye_pounds
      t.integer :coho_pounds
      t.integer :humpy_pounds
      t.integer :king_pounds
      t.datetime :date
      t.integer :ticket_number

      t.timestamps
    end
  end
end
