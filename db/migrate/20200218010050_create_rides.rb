class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end

#writing like this automatically give a foreign key? or need
#like this ...
# t.belongs_to :user, index: true, foreign_key: true
# t.belongs_to :attraction, index: true, foreign_key: true
