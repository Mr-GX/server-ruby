#数据表 rails generate scaffold Product \title:string desc:text image_url:string price:decimal
#将表应用到数据库上 rails db:migrate
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.string :image_url
      t.decimal :price,:precision=>8,:scale=>2

      t.timestamps
    end
  end
end
