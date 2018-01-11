class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :img_url
      t.string :description
      t.string :video_url

      t.timestamps
    end
  end
end
