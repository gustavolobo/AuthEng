require "auth_eng/engine"

module AuthEng
  class AuthEng < Rails::Engine
    # Add a load path for this specific Engine
    config.autoload_paths << File.expand_path("../lib/some/path", __FILE__)

    initializer "auth_eng.add_middleware" do |app|
      app.middleware.use AuthEng::Middleware
    end
  end
end
