class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :photo_id
      t.text :body

      t.timestamps
    end
  end
end
