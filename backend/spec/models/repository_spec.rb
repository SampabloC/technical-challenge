# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository, type: :model do
  describe 'Save data' do
    it 'save a repo correctly' do
      usuario = User.create(id: 999, github_id: 123, login: 'prueba', url: 'prueba.com', name: 'Nombre Usuario')
      repo = Repository.new(user_id: 999, repository_name: 'Repo test', url: 'repo.com')

      assert repo.save, 'Repository Saved'
    end

    it 'should not save a repository without user id' do
      repo = Repository.new(repository_name: 'Repo Name', url: 'prueba.com')

      refute repo.save, 'Saved the repository without an user id'
    end
  end
end
