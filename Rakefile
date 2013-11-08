# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap/http'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'Bitcoined'
  app.icons = Dir.glob("resources/icon*.png").map{ |icon| icon.split("/").last }
  app.prerendered_icon = true
end
