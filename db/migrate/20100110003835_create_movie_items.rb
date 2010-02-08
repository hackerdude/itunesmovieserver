class CreateMovieItems < ActiveRecord::Migration
  def self.up
    create_table :movie_items do |t|
      t.string :name
      t.string :album
      t.string :location
      t.string :genre
      t.string :kind
      t.string :size
      t.integer :total_time
      t.date   :modified
      t.date   :date_added
      t.date   :release_date
      t.integer :artwork_count
      t.integer :disc_number
      t.integer :persistent_id
      t.integer :bit_rate
      t.integer :video_height
      t.integer :video_width
      t.integer :hd
      t.timestamps
    end
    create_table :options do |t|
      t.string :name
      t.string :value
    end
  end

  def self.down
    drop_table :movie_items
    drop_table :options
  end
end
