class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :creator, references: :users, index: true, foreign_key: true, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
