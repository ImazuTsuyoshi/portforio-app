class AddPhoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :age, :string
    add_column :users, :gender, :string
  end
end