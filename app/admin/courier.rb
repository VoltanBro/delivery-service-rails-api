# frozen_string_literal: true

ActiveAdmin.register Courier do
  permit_params :name, :email, :id, :courier_valid, :status, :password, package_ids: []

  index do
    column :name
    column :email
    column :courier_valid
    actions
  end

  show do |courier|
    attributes_table do
      row(:name) { courier.name }
      row(:email) { courier.email }
      row(:courier_valid) { courier.courier_valid? }
      if courier.driver_licence_url.present?
        row(:driver_license) { image_tag(courier.driver_licence_url) }
      end
    end
  end

  form do |f|
    f.inputs "Courier" do
      f.input :name
      f.input :email
      f.input :password
      f.input :package_ids, label: 'Packages', as: :select, multiple: true, collection: Package.where(delivery_status: 'processing').map { |p| [p.tracking_number, p.uuid] }
    end
    f.actions
  end

  controller do
    def update
      if params[:courier][:password].blank?
        params[:courier].delete('password')
      end
      super
    end

    def destroy
      courier = Courier.find(params[:id])
      DriverLicencesValidate.licence_valid(courier)

      redirect_to admin_courier_path, notice: 'Driver licence was validated'
    end
  end


  action_item :driver_licence_valid, priority: 9, only: :show do
    link_to "Validate_Licence", admin_courier_path, method: :delete
  end
end
