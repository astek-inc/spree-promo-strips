class AddIndexesToPromoStripItems < ActiveRecord::Migration
  def change
    add_foreign_key :promo_strip_items, :promo_strips

    change_table :promo_strip_items do |t|
      t.index :position
    end
  end
end
