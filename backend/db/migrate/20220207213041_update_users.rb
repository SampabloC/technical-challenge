# frozen_string_literal: true

class UpdateUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :repositories

    add_foreign_key :repositories, :users, on_delete: :cascade
  end
end
