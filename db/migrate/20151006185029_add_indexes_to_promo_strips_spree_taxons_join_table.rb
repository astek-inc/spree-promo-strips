class AddIndexesToPromoStripsSpreeTaxonsJoinTable < ActiveRecord::Migration
  def change
    change_table :promo_strips_spree_taxons do |t|
      t.index [:promo_strip_id, :taxon_id]
      t.index [:taxon_id, :promo_strip_id]
    end
  end
end
