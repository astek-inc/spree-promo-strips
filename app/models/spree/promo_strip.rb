module Spree
  class PromoStrip < ActiveRecord::Base
    self.table_name = 'promo_strips'
    validates_presence_of :promo_strip_layout_id, :status, :default
    has_many :promo_strip_items
  end
end
