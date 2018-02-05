class Addblacklisttocandidates < ActiveRecord::Migration[5.1]
  def change
  	add_column :candidates, :inblacklist, :boolean, :default => 0
  	add_column :candidates, :reserved, :boolean, :default => 0
  end
end
