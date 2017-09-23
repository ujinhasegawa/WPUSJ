class Information < ApplicationRecord
	belongs_to :user, dependent: :destroy
end
