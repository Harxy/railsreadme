class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.date :date_created
      t.date :date_last_viewed
      t.integer :priority
      t.date :show_date
      t.string :contents

      t.timestamps null: false
    end
  end
end
