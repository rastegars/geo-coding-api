class RenameColumnNameFromPlaces < ActiveRecord::Migration[5.2]
  def change
    rename_column :places, :name, :location
    rename_column :places, :latitude, :lat
    rename_column :places, :longitude, :lon
  end
end
