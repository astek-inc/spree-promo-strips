module Spree
  module Admin
    class PromoStripsController < ResourceController

      before_action :get_layouts #, only: [:new, :edit]
      before_action :destroy_items_on_new_layout, only: :update
      before_action :set_taxon_params, only: [:create, :update]

      # def edit
      #   strip = Spree::PromoStrip.find(params[:id])
      #   @tmp = strip.promo_strip_items
      #   render('debug')
      # end
      # def update
      #   #@tmp = params
      #   render('debug')
      # end

      private

        def permitted_resource_params
          params.require(:promo_strip).
              permit(:id, :promo_strip_layout_id, :status, :default,
                     :taxon_ids => [],
                     promo_strip_items_attributes: [:id, :link, :position, :image, :size]
              )
        end

        def get_layouts
          @promo_strip_layouts = Spree::PromoStripLayout.all
        end

        # Remove the old associated items from the database and delete the
        # attached images if we're changing the layout.
        def destroy_items_on_new_layout
          strip = Spree::PromoStrip.find(params[:id])
          if params[:promo_strip][:promo_strip_layout_id].to_i != strip.promo_strip_layout_id.to_i
            Spree::PromoStripItem.where(:promo_strip_id => params[:id]).each do |item|
              item.image = nil
              item.save
              item.destroy
            end
            #Spree::PromoStripItem.where(:promo_strip_id => params[:id]).destroy_all
          end
        end

        def set_taxon_params
          if params[:promo_strip][:taxon_ids].present?
            params[:promo_strip][:taxon_ids] = params[:promo_strip][:taxon_ids].split(',')
          end
        end

    end
  end
end
