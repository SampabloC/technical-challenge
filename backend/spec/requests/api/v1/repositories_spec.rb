# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Repositories', type: :request do
  describe 'Check methods' do
    it 'gets repositories list successfully' do
      get '/api/v1/repos/list'
      expect(response).to have_http_status(200)
    end

    it 'search for a repository' do
      get api_v1_users_path, params: { username: 'SampabloC' }
      get '/api/v1/repos/search', params: { repository_name: "technical-challenge" }
      body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(body).to have_key('repository_name')
      expect(body['repository_name']).to eq('technical-challenge')
    end

    it 'search for a non existent repository' do
      get '/api/v1/repos/search', params: { repository_name: "technical_challenge" }
      body = JSON.parse(response.body)

      expect(body['message']).to eq('Repository Not Found')
    end
  end
end
