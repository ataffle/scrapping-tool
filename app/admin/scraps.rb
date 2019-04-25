ActiveAdmin.register Scrap do
  permit_params :scrap_url, :user_id, :city, :number

  index do
    selectable_column
    column :id
    column :city
    column :scrap_url
    column :created_at
    column "# of properties", :number
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
