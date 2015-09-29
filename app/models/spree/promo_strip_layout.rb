module Spree
  class PromoStripLayout < ActiveRecord::Base
    self.table_name = 'promo_strip_layouts'
    has_many :promo_strips
  end
end
