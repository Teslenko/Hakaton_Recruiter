class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
