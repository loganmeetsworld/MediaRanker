class AddAttachmentColumn < ActiveRecord::Migration
  def change
  	add_column :media, :attachment, :string
  end
end
