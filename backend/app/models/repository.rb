# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :user_id, presence: true
  validates :repository_name, presence: true
  validates :url, presence: true
end
