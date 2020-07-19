# frozen_string_literal: true

ActiveAdmin.register DeliveryManager do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :enabled, :email, :password, :password_confirmation

  index do
    selectable_column
    # id_column
    column :enabled
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :enabled

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :enabled
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:uuid, :enabled]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
