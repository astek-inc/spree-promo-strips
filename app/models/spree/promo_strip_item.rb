module Spree
  class PromoStripItem < ActiveRecord::Base
    self.table_name = 'promo_strip_items'
    validates_presence_of :promo_strip_id, :image, :link, :position
    belongs_to :promo_strips
  end
end

