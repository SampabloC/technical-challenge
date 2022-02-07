# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        conn = Faraday.new do |f|
          f.request :authorization, 'Bearer', Figaro.env.GITHUB_TOKEN
          f.request :json # encode req bodies as JSON
          f.request :retry # retry transient failures
          f.response :follow_redirects # follow redirects
          f.response :json # decode response bodies as JSON
        end
        user = conn.get("https://api.github.com/users/#{user_params}").body
        repos = conn.get("https://api.github.com/users/#{user_params}/repos", { per_page: 100 }).body
        db_user = User.all.find { |u| u.github_id == user['id'] }
        if db_user.nil?
          db_user = save_user(user)
          save_repos(repos, db_user['id'])                               
        end
        render json: db_user.as_json.except('repositories')
      end

      # Save user data
      def save_user(user)
        User.create({ github_id: user['id'], login: user['login'], url: user['html_url'], name: user['name'],
                                  email: user['email'], avatar_url: user['avatar_url']})
      end

      # Save all repositories on each row of Repository table
      def save_repos(repositories, user_id)
        (0..repositories.length - 1).each do |x|
          repos = repositories[x]
          Repository.create({ user_id: user_id, repository_name: repos['name'], owner: repos['owner']['login'],
                              visibility: repos['visibility'], url: repos['html_url'], description: repos['description']})
        end
      end

      private

      def user_params
        params.require(:username)
      end
    end
  end
end
