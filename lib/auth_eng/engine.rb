require 'devise'
require "rails3_acts_as_paranoid"

module AuthEng
  class Engine < ::Rails::Engine
    isolate_namespace AuthEng
  end
end
