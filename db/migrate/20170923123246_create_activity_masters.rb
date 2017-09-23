class CreateActivityMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_masters do |t|

      t.timestamps
    end
  end
end
