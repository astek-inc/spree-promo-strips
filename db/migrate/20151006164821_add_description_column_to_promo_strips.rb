class AddDescriptionColumnToPromoStrips < ActiveRecord::Migration
  def up
    add_column :promo_strips, :description, :string
  end

  def down
    remove_column :promo_strips, :description
  end
end
