class CreateInvisalignTrackers < ActiveRecord::Migration
  def change
    create_table :invisalign_trackers do |t|
      t.timestamp :in
      t.timestamp :out
      t.integer :duration
      t.integer :daynumber
      t.references :tracker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
