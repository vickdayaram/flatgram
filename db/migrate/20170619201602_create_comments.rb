class CreateComments < ActiveRecord::Migration[5.1]

  def change
    create_table :comments do |t|
      t.string :comment
      t.references :picture
      t.references :user
      t.timestamps
    end
  end

end
