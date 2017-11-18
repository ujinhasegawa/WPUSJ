class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.references :user, index: true, foreign_key: true
      t.string     :name
      t.string     :status
      t.text       :comment
      t.text       :preferred_message
      t.integer    :country_master_id
      t.integer    :area_master_id
      t.integer    :point_month
      t.integer    :point_year
      t.integer    :point_lifetime
      t.integer    :point_bible
      t.integer    :point_divine_principle 
      t.integer    :point_father_message
      t.integer    :point_faith
      t.integer    :point_practice
      t.integer    :rank_month
      t.integer    :rank_year

      t.timestamps
    end
  end
end
