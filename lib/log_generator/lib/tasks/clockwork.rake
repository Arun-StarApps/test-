namespace :clockwork do
    task :send_log do
      require 'clockwork'
      require 'log_generator/config/clock.rb'
  
      Clockwork::run
    end
    
  end