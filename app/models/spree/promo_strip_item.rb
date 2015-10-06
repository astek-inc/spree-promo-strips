module Spree
  class PromoStripItem < ActiveRecord::Base

    self.table_name = 'promo_strip_items'

    attr_accessor :size

    belongs_to :promo_strip

    validates_presence_of :link, :position, :on => :create # :image
    validates_presence_of :link, :position, :on => :update

    # has_attached_file :image, styles: lambda { |image| {standard: (image.instance.size == 'large' ? '1250x450!' : '590x450!')}} #, default_url: "/images/:style/missing.png"
    has_attached_file :image, styles: {large: '1250x450!', small: '590x450!'}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  end
end
