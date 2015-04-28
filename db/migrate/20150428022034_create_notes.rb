class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :raw_body
      t.text :body

      t.timestamps null: false
    end
  end
end
