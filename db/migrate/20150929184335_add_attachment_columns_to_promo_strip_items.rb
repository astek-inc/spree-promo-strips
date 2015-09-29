class AddAttachmentColumnsToPromoStripItems < ActiveRecord::Migration
  def up
    add_attachment :promo_strip_items, :image
  end

  def down
    remove_attachment :promo_strip_items, :image
  end
end
