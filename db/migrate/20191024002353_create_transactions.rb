class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :sender, foreign_key: { to_table: 'users' }
      t.references :recipient, foreign_key: { to_table: 'users' }
      t.integer :balance
      t.text :note

      t.timestamps
    end
  end
end
