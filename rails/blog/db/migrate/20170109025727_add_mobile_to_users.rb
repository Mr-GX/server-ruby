class AddMobileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile, :string, uniqueness:true
  end
end
