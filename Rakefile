# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap/http'
require 'bubble-wrap/rss_parser'
require 'motion-layout'
require 'motion-pp'
require 'motion-settings-bundle'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'Bitcoined'
  app.identifier = 'S7Y8U49M75.com.mikaelharsjo.bitcoined'
  app.icons = Dir.glob("resources/icon*.png").map{ |icon| icon.split("/").last }
  app.prerendered_icon = true
end

Motion::SettingsBundle.setup do |app|
  app.title "Version", key: "version", default: "0.1"

  app.toggle "Enable push notifications?", key: "push_notifications", default: true

  app.multivalue "Exchange market", key: "exchange_market", default: "MtGox", values: ["MtGox", "CoinBase"]

  app.multivalue "Currency", key: "currency", default: 'USD', values: ['USD', 'EUR', 'SEK']

  # Child pane to display licenses in
  app.child "Acknowledgements" do |ack|
    ack.child "Bitcoined" do |lic|
      lic.group "Copyright 2014 Bitcoined"
      lic.group "More license text that is terribly formatted but fulfills legal requirements"
    end
  end
end
