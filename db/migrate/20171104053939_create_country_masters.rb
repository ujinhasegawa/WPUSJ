class CreateCountryMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :country_masters do |t|

      t.timestamps
    end
  end
end
