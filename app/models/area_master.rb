class AreaMaster < ApplicationRecord
	belongs_to :country_master, dependent: :destroy
end
