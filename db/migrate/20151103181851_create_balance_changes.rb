class CreateBalanceChanges < ActiveRecord::Migration
  def change
    create_table :balance_changes do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :payment, index: true, foreign_key: true, null: false
      t.decimal :change, null: false

      t.timestamps null: false
    end
  end
end
