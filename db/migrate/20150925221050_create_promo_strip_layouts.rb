class CreatePromoStripLayouts < ActiveRecord::Migration
  def change
    create_table :promo_strip_layouts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
