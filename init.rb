require 'rubygems'
require 'bundler/setup'

#usual gems
require 'httparty'
require 'nokogiri'
require 'fileutils'
require 'json'
#files
#The actual scraper
require './Helpers/scraper'
#What pushed the scraper to json
require './Helpers/exp_to_json'
# Start of program

