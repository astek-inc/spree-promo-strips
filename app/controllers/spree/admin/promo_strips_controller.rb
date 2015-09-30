module Spree
  module Admin
    class PromoStripsController < ResourceController

      before_action :get_layouts #, only: [:new, :edit]

      private

        def permitted_resource_params
          params.require(:promo_strip).
              permit(:id, :promo_strip_layout_id, :status, :default,
                     promo_strip_items_attributes: [:id, :link, :position, :image, :size]
              )
        end

        def get_layouts
          @promo_strip_layouts = Spree::PromoStripLayout.all
        end

    end
  end
end


