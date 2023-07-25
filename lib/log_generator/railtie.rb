

module LogGenerator
    class Railtie < Rails::Railtie
      initializer 'log_generator.send_log' do
        # Code to run your rake task here
        Rake::Task['clockwork:send_log'].invoke
      end
    end
  end
  