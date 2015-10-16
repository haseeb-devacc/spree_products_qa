Deface::Override.new(virtual_path: 'spree/admin/shared/_product_tabs',
                     name: 'add_qa_link',
                     insert_bottom: '[data-hook="fcp_admin_product_tabs"]',
                     partial: 'spree/admin/shared/additional_product_tabs')
#
# Deface::Override.new(virtual_path: 'spree/admin/shared/_edit_resource_links',
#                      name: "button",
#                      replace: "button.fa",
#                      text: "<%= button_link_to t('actions.add_answer'), admin_product_questions_path %>")
