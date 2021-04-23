class CreateBoats < ActiveRecord::Migration[6.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :captain
      t.string :home_port

      t.timestamps
    end
  end
end
