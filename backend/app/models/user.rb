# frozen_string_literal: true

class User < ApplicationRecord
  validates :github_id, presence: true, uniqueness: true
  validates :login, presence: true
  validates :url, presence: true
  validates :name, presence: true
end
