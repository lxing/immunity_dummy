#!/usr/bin/ruby

require "json"
require "rest-client"
require "sinatra/base"

class Dummy < Sinatra::Base
  set :port, 8123
  
  get '/' do
    "I am a fish"
  end

  run!
end
