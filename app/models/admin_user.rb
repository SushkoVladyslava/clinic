class AdminUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, authentication_keys: [:email]
end

