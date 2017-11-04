class CreateAreaMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :area_masters do |t|

      t.timestamps
    end
  end
end
