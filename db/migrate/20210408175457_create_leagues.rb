class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.integer :price_cents

      t.timestamps
    end
  end
end
