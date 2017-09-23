class CreateActivityMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_masters do |t|
    	t.string  :title
    	t.text    :detail
    	t.integer :group
    	t.integer :point

      t.timestamps
    end
  end
end
