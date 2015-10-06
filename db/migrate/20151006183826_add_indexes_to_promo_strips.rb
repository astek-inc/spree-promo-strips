class AddIndexesToPromoStrips < ActiveRecord::Migration
  def change
    add_foreign_key :promo_strips, :promo_strip_layouts

    change_table :promo_strips do |t|
      t.index :status
      t.index :default
    end
  end
end
