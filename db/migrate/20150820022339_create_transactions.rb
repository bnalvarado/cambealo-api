class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :product_offered_id
      t.integer :product_req_id
      t.string :date
      t.string :state

      t.timestamps null: false
    end
  end
end
