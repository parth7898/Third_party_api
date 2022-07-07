class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :coin_id
      t.string :name
      t.string :symbool
      t.timestamps
    end
  end
end
