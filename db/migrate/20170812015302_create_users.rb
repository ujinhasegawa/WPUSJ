class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :group_name
      t.integer :point_month
      t.integer :point_year
      t.integer :point_lifetime
      t.integer :rank_month
      t.integer :rank_year

      t.timestamps
    end
  end
end
