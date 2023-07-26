

module LetscaleRuby
    class Railtie < Rails::Railtie
        config.after_assets_precompile do
            if ENV["IS_MIRROR"].present? && ENV["LOG_TOKEN"].present?
              # Code to run your rake task here
              Rake::Task['clockwork:send_log'].invoke 
            end
          end
    end
  end