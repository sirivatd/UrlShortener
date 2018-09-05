class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id, presence: true
      t.integer :url_id, presence: true 
      t.timestamps
    end
  end
end
