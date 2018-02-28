class ChangeStartDateColumnInTrackers < ActiveRecord::Migration
  def change
    change_column :trackers, :start_date, :string
  end
end
