class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.references :user,  index: true, foreign_key: true
      t.string     :name
      t.string     :country
      t.string     :area
      t.integer    :point_month
      t.integer    :point_year
      t.integer    :point_lifetime
      t.integer    :rank_month
      t.integer    :rank_year

      t.timestamps
    end
  end
end
