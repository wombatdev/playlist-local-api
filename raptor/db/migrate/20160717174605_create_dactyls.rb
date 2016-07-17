class CreateDactyls < ActiveRecord::Migration[5.0]
  def change
    create_table :dactyls do |t|
        t.string :name
        t.string :access_code
        t.integer :songs_per_user
        t.string :location
        t.timestamps
    end
  end
end
