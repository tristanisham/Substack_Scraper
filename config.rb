#!/usr/bin/ruby
require 'rubygems'
require 'bundler/setup'

#usual gems
require 'httparty'
require 'nokogiri'
require 'fileutils'
require 'json'
#files
#The actual scraper
require './Ops/scraper'
#What pushed the scraper to json
require './Exporters/exp_to_json'
# Start of program

