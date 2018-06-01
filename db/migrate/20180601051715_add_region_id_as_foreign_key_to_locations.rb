class AddRegionIdAsForeignKeyToLocations < ActiveRecord::Migration[5.1]
  def change
    add_reference :locations, :region, index: true
  end
end
