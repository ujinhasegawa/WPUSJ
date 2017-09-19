class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :country
      t.string   :area
      t.integer  :group_id
      t.integer  :point_month
      t.integer  :point_year
      t.integer  :point_lifetime
      t.integer  :rank_month
      t.integer  :rank_year
      t.string   :email
      t.string   :password
      t.datetime :last_login

      t.timestamps
    end
  end
end
