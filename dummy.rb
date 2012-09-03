#!/usr/bin/ruby

require "bundler/setup"
require "json"
require "rest-client"
require "sinatra/base"
require "hastur"

class Dummy < Sinatra::Base
  set :port, 8125

  @@echo = {}

  get "/" do
    "echo something!"
  end

  get "/:path" do
    Hastur.counter("immunity_dummy.fetch")
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
