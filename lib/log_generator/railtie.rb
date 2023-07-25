

module LogGenerator
    class Railtie < Rails::Railtie
        config.after_initialize do
            if defined?(Rails::Server) && Rails.const_defined?('Server')
              # Code to run your rake task here
              puts "Invoking command========="
              Rake::Task['clockwork:send_log'].invoke
            end
          end
    end
  end
  