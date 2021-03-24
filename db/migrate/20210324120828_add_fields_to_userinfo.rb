class AddFieldsToUserinfo < ActiveRecord::Migration[5.2]
  def change
  	add_column :userinfos, :Jobtitle, :string
  	add_column :userinfos, :passions, :string
  	add_column :userinfos, :company,  :string
  	add_column :userinfos, :school,   :string
  	add_column :userinfos, :contactinfo, :string
	add_column :userinfos, :from,  :string
	add_column :userinfos, :eduction, :string
  end
end
