# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    user_id { 'MyString' }
    repository_name { 'MyString' }
    owner { 'MyString' }
    visibility { 'MyString' }
    url { 'MyString' }
    description { 'MyString' }
  end
end
