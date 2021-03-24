class AddUserIdToUserinfo < ActiveRecord::Migration[5.2]
  def change
  	    add_column :userinfos, :user_id, :int
  end
end
