class Information < ApplicationRecord
  belongs_to :user, dependent: :destroy

  def country
    return '' if self.country_master_id.nil?
    CountryMaster.find(self.country_master_id).name
  end

  def area
    return '' if self.area_master_id.nil?
    AreaMaster.find(self.area_master_id).name
  end
end
