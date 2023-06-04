class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :phone, null: false
      t.string  :city
      t.string  :role
      t.integer :years_of_work
      t.float   :price
      t.string  :sex
      t.string  :description
      t.references  :doctors_category

      t.timestamps
    end
  end
end
