module Spree
  class PromoStrip < ActiveRecord::Base

    self.table_name = 'promo_strips'

    belongs_to :promo_strip_layout
    has_many :promo_strip_items

    validates_presence_of :promo_strip_layout_id, :status, :default

    accepts_nested_attributes_for :promo_strip_items

  end
end
