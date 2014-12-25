class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :ip

      t.timestamps null: false
    end
  end
end
