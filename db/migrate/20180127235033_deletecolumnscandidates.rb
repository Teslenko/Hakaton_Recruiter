class Deletecolumnscandidates < ActiveRecord::Migration[5.1]
  def change
  	remove_column :candidates, :reserved, :boolean
  	change_column :candidates, :inblacklist, :string
  end
end
