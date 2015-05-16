class AddProblemToIdeas < ActiveRecord::Migration
  def change
  	change_column :ideas, :description, :text
  	add_column :ideas, :problem, :text
  end
end
