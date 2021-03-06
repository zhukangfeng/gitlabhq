module Gitlab
  module GithubImport
    class Client
      attr_reader :client

      def initialize
        @client = ::OAuth2::Client.new(
          config.app_id,
          config.app_secret,
          github_options
        )
      end

      private

      def config
        Gitlab.config.omniauth.providers.find{|provider| provider.name == "github"}
      end

      def github_options
        {
          site: 'https://api.github.com',
          authorize_url: 'https://github.com/login/oauth/authorize',
          token_url: 'https://github.com/login/oauth/access_token'
        }
      end
    end
  end
end
