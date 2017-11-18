class CreateAreaMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :area_masters do |t|
      t.references :country_master, index: true, foreign_key: true
      t.string     :name

      t.timestamps
    end
  end
end
