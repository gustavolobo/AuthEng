require 'devise'

module AuthEng
  class Engine < ::Rails::Engine
    isolate_namespace AuthEng
  end
end
