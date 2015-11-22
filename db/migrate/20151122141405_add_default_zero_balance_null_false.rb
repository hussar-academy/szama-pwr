class AddDefaultZeroBalanceNullFalse < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute("UPDATE users SET balance=0.0 WHERE balance IS NULL;")
    change_column :users, :balance, :decimal, default: 0.0, null: false
  end

  def down
    change_column :users, :balance, :decimal, default: nil, null: true
  end
end
