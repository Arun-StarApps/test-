namespace :clockwork do
    task :send_log do
      require 'clockwork'
      require 'letscale_ruby/config/clock.rb'
  
      Clockwork::run
    end
    
  end