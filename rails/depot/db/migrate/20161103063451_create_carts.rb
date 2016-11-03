#rails generate scaffold cart
#将表应用到数据库上 rails db:migrate
class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|

      t.timestamps
    end
  end
end
