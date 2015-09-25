class CreatePromoStripItems < ActiveRecord::Migration
  def up
    create_table :promo_strip_items do |t|
      t.integer :promo_strip_id
      t.string :image
      t.string :link
      t.integer :position

      t.timestamps null: false
    end
  end

  def down
    drop_table :promo_strip_items
  end
end
