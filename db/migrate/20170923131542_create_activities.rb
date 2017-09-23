class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string   :title
      t.text     :memo
      t.integer  :group
      t.integer  :point
      t.datetime :achieve_at

      t.timestamps
    end
  end
end
