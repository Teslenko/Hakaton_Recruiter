class Changeindexcolumncomments < ActiveRecord::Migration[5.1]
  def change
  	remove_column :candidates, :index_comments_on_candidate_id
  end
end
