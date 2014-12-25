class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :blog_id
      t.string :ip

      t.timestamps null: false
    end
  end
end
