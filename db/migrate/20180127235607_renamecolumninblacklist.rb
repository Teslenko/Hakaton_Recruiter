class Renamecolumninblacklist < ActiveRecord::Migration[5.1]
  def change
  	rename_column :candidates, :inblacklist, :status
  end
end
