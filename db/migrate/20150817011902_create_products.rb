class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.string :picture
      t.string :status
      t.string :register_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
