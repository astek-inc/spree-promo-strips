Spree::ProductsController.class_eval do

  before_action :get_promo_strip, only: :show
  before_action :get_promo_strip_item_sizes, only: :show

  private

    def get_promo_strip

      max_specificity = 0
      @product.taxons.each do |taxon|
        if taxon.depth > max_specificity
          max_specificity = taxon.depth
        end
      end

      # Look for a promo strip assigned to the product's taxons in order of specificity,
      # from greatest to least.
      catch :outside do
        (0..max_specificity).reverse_each do |i|
          @product.taxons.each do |taxon|
            if taxon.depth == i
              @promo_strip = Spree::PromoStrip.includes(:taxons).where('spree_taxons.id' => taxon.id).first
              throw :outside unless @promo_strip.nil?
            end
          end
        end
      end

      # If nothing found, try the ancestor taxons in order of specificity,
      # from greatest to least.
      if @promo_strip.nil?
        catch :outside do
          @product.taxons.each do |taxon|
            (0..max_specificity).reverse_each do |i|
              ancestor = taxon.ancestors
              ancestor.each do |ancestor|
                if ancestor.depth == i
                  @promo_strip = Spree::PromoStrip.includes(:taxons).where('spree_taxons.id' => ancestor.id).first
                  throw :outside unless @promo_strip.nil?
                end
              end
            end
          end
        end
      end

      # Fall back to default if nothing else found
      if @promo_strip.nil?
        @promo_strip = Spree::PromoStrip.where(:default => true).first
      end

    end

    def get_promo_strip_item_sizes

      unless @promo_strip.nil?
        case @promo_strip.promo_strip_layout_id
          when 1
            @promo_strip_item_sizes = ['small', 'small', 'small', 'small']

          when 2
            @promo_strip_item_sizes = ['large', 'small', 'small']

          when 3
            @promo_strip_item_sizes = ['small', 'small', 'large']

          when 4
            @promo_strip_item_sizes = ['large', 'large']
        end
      end

    end
end

