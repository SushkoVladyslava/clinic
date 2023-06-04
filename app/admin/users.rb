ActiveAdmin.register User do
  permit_params :first_name, :last_name, :role, :sex, :description, :city, :years_of_work, :price, :doctors_category_id,
                :email, :phone, :password, :encrypted_password, :reset_password_token, :reset_password_sent_at,
                :remember_created_at

  form do |f|
    f.inputs do
      f.label 'Select category'
      f.collection_select :doctors_category_id, DoctorsCategory.order(:name),:id,:name, include_blank: false
      f.input :first_name
      f.input :last_name
      f.input :role, :input_html => { :value => 'doctor' }
      f.input :sex
      f.input :description
      f.input :city
      f.input :years_of_work
      f.input :price
      f.input :email, include_blank: false, hint: 'Please enter email'
      f.input :phone
      f.input :password
    end
    f.actions
  end
end
