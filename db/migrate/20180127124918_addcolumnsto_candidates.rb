class AddcolumnstoCandidates < ActiveRecord::Migration[5.1]
  def change
  	
  	add_column :candidates, :level_skills, :string
    add_column :candidates, :dev_language, :string
    add_column :candidates, :suggest_project, :string
    add_column :candidates, :contact_data, :text
    add_column :candidates, :present_job, :text
    add_column :candidates, :expected_salary, :integer
    add_column :candidates, :final_salary, :integer
    add_column :candidates, :data_from, :text
    add_column :candidates, :comments, :text
    add_column :candidates, :level_language, :string
  end
end
