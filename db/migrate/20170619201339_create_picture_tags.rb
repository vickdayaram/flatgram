class CreatePictureTags < ActiveRecord::Migration[5.1]

  def change
    create_table :picture_tags do |t|
      t.references :picture
      t.references :tag
      t.timestamps
    end
  end

end
