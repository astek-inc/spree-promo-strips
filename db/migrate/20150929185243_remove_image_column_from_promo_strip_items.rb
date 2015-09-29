class RemoveImageColumnFromPromoStripItems < ActiveRecord::Migration
  def change
    remove_column :promo_strip_items, :image, :string
  end
end
