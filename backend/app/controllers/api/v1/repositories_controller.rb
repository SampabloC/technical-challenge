# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController
      def index
        repos = Repository.all.order(repository_name: :asc)
        render json: repos.map { |x| {
          "User ID": x['user_id'],
          "Repository Name": x['repository_name']
        }}
      end

      def search_repository
        repo = Repository.find_by(repository_name: name_repository)
        if repo
          render json: repo
        else
          render json: {
            message: "Repository Not Found"
          }
        end
      end

      private

      def name_repository
        params.require(:repository_name)
      end
    end
  end
end
