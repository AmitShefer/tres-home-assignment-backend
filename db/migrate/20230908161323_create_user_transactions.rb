class CreateUserTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_transactions do |t|
      t.integer :user_id
      t.string :txn_hash
      t.string :method
      t.string :from
      t.string :to
      t.decimal :value
      t.decimal :fee

      t.timestamps
    end
  end
end
