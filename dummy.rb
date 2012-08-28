#!/usr/bin/ruby

require "json"
require "rest-client"
require "sinatra/base"
require "hastur"

class Dummy < Sinatra::Base
  set :port, 8123
  
  get '/' do
    Hastur.counter("immunity_dummy")
    "I am a fish"
  end

  run!
end
