ActiveAdmin.register Property do
  permit_params :scrap_id, :ref, :city, :title, :price, :url, :phone, :date

  index do
    selectable_column
    column :id
    column :ref
    column :city
    column :title
    column "Monthly rent", :price
    column "Posted on", :date
    column :phone
    column :url do |property|
      link_to "Link", property.url, target: "_blank"
    end
    actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
