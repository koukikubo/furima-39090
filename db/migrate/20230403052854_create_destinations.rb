class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string      :post_code,  null: false
      t.integer     :prefecture_id, null: false
      t.string      :city_name, null: false
      t.string      :address, null: false
      t.string      :building_name
      t.string      :phone_number, null: false
      t.references  :user_transact, null: false, foreign_key: true
      t.timestamps
    end
  end
end
