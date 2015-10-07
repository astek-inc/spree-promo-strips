class SeedPromoStripLayouts < ActiveRecord::Migration
  def up
    layouts = [
        {'name' => '4 small'},
        {'name' => '1 large, 2 small'},
        {'name' => '2 small, 1 large'},
        {'name' => '2 large'},
    ]

    layouts.each do |layout|
      Spree::PromoStripLayout.create!(layout)
    end
  end

  def down
    ActiveRecord::Base.connection.execute('TRUNCATE TABLE promo_strip_layouts')
    ActiveRecord::Base.connection.execute('ALTER SEQUENCE promo_strip_layouts_id_seq RESTART WITH 1')
  end
end
