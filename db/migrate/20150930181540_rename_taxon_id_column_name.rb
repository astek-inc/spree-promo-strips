class RenameTaxonIdColumnName < ActiveRecord::Migration
  def up
    rename_column :promo_strips_spree_taxons, :spree_taxon_id, :taxon_id
  end

  def down
    rename_column :promo_strips_spree_taxons, :taxon_id, :spree_taxon_id
  end
end
