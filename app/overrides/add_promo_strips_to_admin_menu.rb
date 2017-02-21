Deface::Override.new(
    original: '8cf26bbac9fde4487b558964abde5a046a59a62d',
    virtual_path: 'spree/layouts/admin',
    name: 'add_promo_strips_item_to_admin_menu',
    insert_bottom: "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
    text: "<ul class=\"nav nav-sidebar\">
        <%= tab t(:promo_strips), url: admin_promo_strips_path, icon: 'star' %>
      </ul>"
)
