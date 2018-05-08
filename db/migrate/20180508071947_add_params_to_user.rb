class AddParamsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile, :string
    add_column :users, :nick_name, :string
    add_column :users, :user_type, :integer
    add_column :users, :avatar, :string
  end
end
