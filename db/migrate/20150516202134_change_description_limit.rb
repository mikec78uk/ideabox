class ChangeDescriptionLimit < ActiveRecord::Migration
  def change
  	change_column :ideas, :description, :text, :limit => nil
  end
end
