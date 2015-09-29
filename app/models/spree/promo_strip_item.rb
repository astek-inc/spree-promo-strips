module Spree
  class PromoStripItem < ActiveRecord::Base

    self.table_name = 'promo_strip_items'

    belongs_to :promo_strip

    # validates_presence_of :promo_strip_id, :image, :link, :position, :on => :create
    # validates_presence_of :promo_strip_id, :link, :position, :on => :update

    has_attached_file :image #, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  end
end
