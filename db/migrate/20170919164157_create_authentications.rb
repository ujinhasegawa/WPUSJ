class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
    	t.string   :name,     :null => false
    	t.string   :token,    :null => false
    	t.datetime :deadline, :null => false

      t.timestamps
    end
  end
end
