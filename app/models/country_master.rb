class CountryMaster < ApplicationRecord
	has_many :area_master
	accepts_nested_attributes_for :area_master
end
