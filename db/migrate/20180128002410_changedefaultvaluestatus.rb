class Changedefaultvaluestatus < ActiveRecord::Migration[5.1]
  def change

  	change_column :candidates, :status, :string, :default => 'Home'
  end
end
