class CreateJoinTablePromoStripSpreeTaxon < ActiveRecord::Migration
  def up
    create_join_table :promo_strips, :spree_taxons do |t|
      # t.index [:promo_strip_id, :spree_taxon_id]
      # t.index [:spree_taxon_id, :promo_strip_id]
    end
  end

  def down
    drop_join_table :promo_strips, :spree_taxons
  end
end
