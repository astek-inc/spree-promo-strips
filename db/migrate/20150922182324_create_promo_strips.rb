class CreatePromoStrips < ActiveRecord::Migration
  def up
    create_table :promo_strips do |t|
      t.integer :promo_strip_layout_id
      t.boolean :status
      t.boolean :default

      t.timestamps null: false
    end
  end

  def down
    drop_table :promo_strips
  end
end
