class AddMediaTypetoMediumModel < ActiveRecord::Migration
  def change
  	add_column :media, :type, :string
  	change_column_default :media, :rank, 0
  end
end
