# frozen_string_literal: true

class GitHubClient
  attr_reader :http_client

  ACCESS_TOKEN = ENV['TOKEN_GITHUB_GIST']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def get_gists
    @http_client.user.rels[:gists].href #link to gists
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
