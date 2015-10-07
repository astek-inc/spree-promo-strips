$(function(){
    $('#promo_strip_promo_strip_layout_id').change(function(){
        $('.promo-strip-layout').hide();
        $('.promo-strip-layout input').attr('disabled', true);

        target_id = '#promo-strip-layout-' + $(this).val();
        $(target_id).show();
        $(target_id + ' input').attr('disabled', false);
    });
});

var set_taxon_select = function(selector){
    if ($(selector).length > 0) {
        $(selector).select2({
            placeholder: Spree.translations.taxon_placeholder,
            multiple: true,
            initSelection: function (element, callback) {
                var url = Spree.url(Spree.routes.taxons_search, {
                    ids: element.val(),
                    token: Spree.api_key
                });
                return $.getJSON(url, null, function (data) {
                    return callback(data['taxons']);
                });
            },
            ajax: {
                url: Spree.routes.taxons_search,
                datatype: 'json',
                data: function (term, page) {
                    return {
                        per_page: 50,
                        page: page,
                        without_children: true,
                        q: {
                            name_cont: term
                        },
                        token: Spree.api_key
                    };
                },
                results: function (data, page) {
                    var more = page < data.pages;
                    return {
                        results: data['taxons'],
                        more: more
                    };
                }
            },
            formatResult: function (taxon) {
                return taxon.pretty_name;
            },
            formatSelection: function (taxon) {
                return taxon.pretty_name;
            }
        });
    }
}

$(document).ready(function () {
    set_taxon_select('#promo_strip_taxon_ids')
});
