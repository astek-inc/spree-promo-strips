module Spree
  Taxon.class_eval do
    has_and_belongs_to_many :promo_strips
  end
end
