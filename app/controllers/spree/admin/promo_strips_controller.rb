module Spree
  module Admin
    class PromoStripsController < ResourceController

      # before_action :permitted_resource_params #, only: [:create, :update]

      # def index
      #   @promo_strips = Spree::PromoStrip.all
      #   @promo_strip_count = Spree::PromoStrip.count
      # end
      #
      # def new
      #   @promo_strip = Spree::PromoStrip.new
      #
      # end
      #
      # def create
      #   @promo_strip = Spree::PromoStrip.new(promo_strip_params)
      #   if @promo_strip.save
      #     flash[:notice] = 'Promo strip created successfully.'
      #     redirect_to(:action => 'edit', :id => @promo_strip.id)
      #   else
      #     render('new')
      #   end
      # end
      #
      # def edit
      #   puts "hello"
      #   @promo_strip = Spree::PromoStrip.find(params[:id])
      #   @tmp = 'Hi'
      # end


      # def update
        # Find an existing object using form parameters
        #@promo_strip = Spree::PromoStrip.find(params[:id])
        # Update the object
        # if @promo_strip.update_attributes(permitted_resource_params)
        #   # If update succeeds, redirect to the index action
        #   flash[:notice] = 'Promo strip updated successfully.'
        #   redirect_to(:action => 'index')
        # else
        #   # If update fails, redisplay the form so user can fix problems
        #   render('edit')
        # end

        # @tmp = @promo_strip
        # render('debug')
      # end


      # def delete
      #   @promo_strip = Spree::PromoStrip.find(params[:id])
      #   @promo_strip.status = false
      #   if @promo_strip.save
      #     flash[:notice] = 'Promo strip now inactive.'
      #     redirect_to(:action => 'edit', :id => @promo_strip.id)
      #   else
      #     render('index')
      #   end
      # end

      private

       def permitted_resource_params
         params.require(:promo_strip).permit(:promo_strip_layout_id, :status, :default)
       end

    end
  end
end


