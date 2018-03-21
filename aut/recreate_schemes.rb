#!/usr/bin/env ruby
require 'xcodeproj'
xcproj = Xcodeproj::Project.open("App name.xcodeproj")
xcproj.recreate_user_schemes
xcproj.save
