class CreateBottlesTable < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.text :description
      t.text :note
    end
  end
end
