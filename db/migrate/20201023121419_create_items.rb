class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references    :user,                    null: false,  foreign_key:  true
      t.integer       :price,                   null: false
      t.integer       :days_id,                 null: false
      t.integer       :area_id,                 null: false
      t.integer       :cost_burden_id,          null: false
      t.integer       :status_id,               null: false
      t.integer       :category_id,             null: false
      t.text          :description,             null: false
      t.string        :name,                    null: false
      t.timestamps
    end
  end
end
