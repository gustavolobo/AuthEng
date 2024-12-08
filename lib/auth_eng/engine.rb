module AuthEng
  class Engine < ::Rails::Engine
    isolate_namespace AuthEng
    config.generators.api_only = true
    config.generators.test_framework :rspec
  end
end
