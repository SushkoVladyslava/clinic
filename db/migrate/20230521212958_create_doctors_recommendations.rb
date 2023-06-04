class CreateDoctorsRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors_recommendations do |t|
      t.string     :name
      t.string     :description
      t.references :appointment

      t.timestamps
    end
  end
end
