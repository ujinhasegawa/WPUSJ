class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, index: true, foreign_key: true
      t.string     :title
      t.text       :memo
      t.integer    :group
      t.integer    :point
      t.datetime   :achieved_at

      t.timestamps
    end
  end
end
