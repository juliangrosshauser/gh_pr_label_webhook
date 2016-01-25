require 'bundler/setup'

require 'sinatra/base'
require 'json'

module GHPRLabelWebhook
  class Webhook < Sinatra::Base
    post '/payload' do
      json = JSON.parse request.body.read
      return unless json["action"] == "labeled"
      puts "Pull request \"#{json["pull_request"]["title"]}\" was labeled \"#{json["label"]["name"]}\""
    end
  end
end
