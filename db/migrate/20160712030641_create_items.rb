class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :url
      t.integer :status, default: 1
      t.integer :order_number
      t.integer :pid
      t.timestamps null: false
    end
  end
end
