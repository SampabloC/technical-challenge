class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.integer :user_id
      t.string :repository_name
      t.string :owner
      t.string :visibility
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
