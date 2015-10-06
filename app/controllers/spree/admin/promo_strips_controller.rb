module Spree
  module Admin
    class PromoStripsController < ResourceController

      before_action :get_layouts #, only: [:new, :edit]
      before_action :destroy_items_on_new_layout, only: :update
      before_action :reset_default, only: [:create, :update]
      before_action :set_taxon_params, only: [:create, :update]

      private

        def permitted_resource_params
          params.require(:promo_strip).
              permit(:id, :description, :promo_strip_layout_id, :status, :default,
                     :taxon_ids => [],
                     promo_strip_items_attributes: [:id, :link, :position, :image, :size]
              )
        end

        def get_layouts
          @promo_strip_layouts = Spree::PromoStripLayout.all
        end

        # If the current promo strip has its default flag set to true, unset the
        # default flag on any promo strip which currently has it set to true.
        def reset_default
          if params[:promo_strip][:default] == true
            Spree::PromoStrip.all.where(:default => true).each do |promo_strip|
              promo_strip.default = false
              promo_strip.save
            end
          end
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
          end
        end

        def set_taxon_params
          if params[:promo_strip][:taxon_ids].present?
            params[:promo_strip][:taxon_ids] = params[:promo_strip][:taxon_ids].split(',')
          else
            params[:promo_strip][:taxon_ids] = []
          end
        end

    end
  end
end
