class UpdateBottleTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :bottles, :type, :variety
  end
end
