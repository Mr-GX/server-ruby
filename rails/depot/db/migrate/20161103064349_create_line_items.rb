#rails generate scaffold line_item product_id:integer cart_id:integer
#将表应用到数据库上 rails db:migrate
class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
