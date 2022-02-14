# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Save data' do
    it 'save user correctly' do
      usuario = User.new
      usuario.github_id = 12_345
      usuario.login = 'prueba'
      usuario.url = 'prueba.com'
      usuario.name = 'Nombre Usuario'
      usuario.email = 'usuario@mail.com'
      usuario.avatar_url = 'avatar_url.com'
      assert usuario.save, 'Saved the user'
    end

    it 'should not save a user without github id' do
      usuario = User.new(login: 'prueba', url: 'prueba.com', name: 'Nombre Usuario')

      refute usuario.save, 'Saved the user without a github id'
    end

    it 'should not save duplicated githubs id' do
      User.create(github_id: 12_345, login: 'usuario 1', url: 'url.com', name: 'User 1')
      usuario = User.new(github_id: 12_345, login: 'prueba', url: 'prueba.com', name: 'Nombre')

      refute usuario.save, 'Saved a duplicated github id'
    end
  end
end
