class Renamecolumcandidatescomments < ActiveRecord::Migration[5.1]
  def change
  		rename_column :candidates, :comments, :cand_comment
  end
end
