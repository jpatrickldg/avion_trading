class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.float :quantity
      t.float :price
      t.float :amount
      t.string :transaction_type

      t.timestamps
    end

    add_index :transactions, [:user_id, :stock_id], unique: true
  end
end
