class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.string :count

      t.timestamps null: false
    end
  end
end
