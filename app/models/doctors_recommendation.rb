class DoctorsRecommendation < ApplicationRecord
  belongs_to :appointment, :dependent => :destroy
end
