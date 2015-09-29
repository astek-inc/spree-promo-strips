module Spree
  module Admin
    class PromoStripsController < ResourceController

      before_action :get_layouts, only: [:new, :edit]
      before_action :handle_images, only: [:update]
      # before_action :destroy_promo_strip_items, only: [:update]

      # def create
      #   @tmp = params
      #   render('debug')
      # end

      def update
        #@tmp = params
        render('debug')
      end

      private

        def permitted_resource_params
          params.require(:promo_strip).
              permit(:promo_strip_layout_id, :status, :default,
                     promo_strip_items_attributes: [:link, :position]
              ) #:image
        end

        def get_layouts
          @promo_strip_layouts = Spree::PromoStripLayout.all
        end

      # If we're changing the layout we can let the image data be deleted.
      # If not, we need to save the current image data when no new images
      # are being uploaded.
      def handle_images
        item_images = {}
        Spree::PromoStripItem.where(promo_strip_id: params[:id]).find_each do |item|
          item_images[item.position] = item.link
        end



      end

      def destroy_promo_strip_items
        Spree::PromoStripItem.destroy_all(:promo_strip_id => params[:id])
      end

    end
  end
end


