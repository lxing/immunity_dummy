#!/usr/bin/ruby

require "json"
require "rest-client"
require "sinatra/base"
require "hastur"

class Dummy < Sinatra::Base
  set :port, 8125

  @@echo = {}
  
  get "/:path" do
    Hastur.counter("immunity_dummy")
    path = params[:path]
    data = params[:data]
    return @@echo[path] unless data
    @@echo[path] = data
    "stored #{data} at #{path}"
  end

  run!
end
