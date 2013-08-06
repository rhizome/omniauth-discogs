# -*- encoding: utf-8 -*- 
$:.push File.expand_path("../lib", __FILE__)
require 'omniauth-discogs/version'

Gem::Specification.new do |spec|
  spec.name           = "omniauth-discogs"
  spec.version        = OmniAuth::Discogs::VERSION
  spec.authors        = ["Eric Hill"]
  spec.email          = "eric@many9s.com"
  spec.description    = "OmniAuth strategy for Discogs"
  spec.summary        = "OmniAuth strategy for Discogs"
  spec.homepage       = "http://github.com/rhizome/omniauth-discogs"
  spec.license        = "MIT"

  spec.files          = `git ls-files`.split("\n")
  spec.require_paths  = ["lib"]

  # spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth'
end
