# frozen_string_literal: true

require 'gitignore/version'

require 'http'

module Gitignore
  class Error < StandardError; end

  class << self
    GITIGNORE_HOST = ENV['GITIGNORE_HOST'] || 'https://www.toptal.com/developers/gitignore'

    def list
      response = HTTP.get("#{GITIGNORE_HOST}/api/list")
      response.body.to_s.gsub(/\n/, ',').split(',')
    end

    def generate(envs = [])
      response = HTTP.get("#{GITIGNORE_HOST}/api/#{envs.join(',')}")
      response.body.to_s
    end
  end
end
