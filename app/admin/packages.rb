# frozen_string_literal: true

ActiveAdmin.register Package do
  permit_params :tracking_number, :courier_id, :estimated_delivery_date, :delivery_status

  index do
    column :tracking_number
    column :estimated_delivery_date
    column :created_at
    column :updated_at
    column :delivery_status
    actions
  end

  show do |package|
    attributes_table do
      row(:tracking_number) { package.tracking_number }
      row(:estimated_delivery_date) { package.estimated_delivery_date }
      row(:delivery_status) { package.delivery_status }
      row(:created_at) { package.created_at }
      row(:updated_at) { package.updated_at }
    end
  end

  controller do
    def destroy
      @package = CancelPackage.check_status(Package.find(params[:id]))
      if @package
        redirect_to admin_package_path
      else
        flash.alert = "You can cancelled only package with 'new' or 'processing' status"
        render :edit
      end
    end
  end

  action_item :cancel_packages, priority: 9, only: :show do
    link_to "Cancel Package", admin_package_path, method: :delete
  end
end
