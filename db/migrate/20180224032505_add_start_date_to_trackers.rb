class AddStartDateToTrackers < ActiveRecord::Migration
  def change
    add_column :trackers, :start_date, :timestamp
  end
end
