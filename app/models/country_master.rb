class CountryMaster < ApplicationRecord
  has_many :area_master
  accepts_nested_attributes_for :area_master

  def areas
    self.area_master
  end
end
