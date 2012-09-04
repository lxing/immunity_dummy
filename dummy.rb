#!/usr/bin/ruby

require "json"
require "rest-client"
require "sinatra/base"

class Dummy < Sinatra::Base
  set :port, 8125

  @@echo = {}

  get "/" do
    "echo something!"
  end

  get "/:path" do
    path = params[:path]
    if @@echo[path]
      "#{path}:#{@@echo[path]}"
    else
      "not found"
    end
  end

  get "/:path/:data" do
    path = params[:path]
    data = params[:data]
    @@echo[path] = data
    "stored #{path}:#{data}"
  end

  run!
end
