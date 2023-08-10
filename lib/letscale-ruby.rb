module LetscaleRuby

  class Railtie < Rails::Railtie
    config.after_initialize do
      dyno = ENV["DYNO"]
      if dyno&.start_with?("worker") &&  dyno.split(".")[1].to_i == 1 &&  ENV["IS_MIRROR"].present?

        thread1 = Thread.new { start_worker() }        
        thread2 = Thread.new {  Clockwork.run }

        thread1.join
        thread2.join
    
        if !thread1.alive? || !thread2.alive?
          LetscaleRuby.restart_dynos
        end
      end
    end
    def start_worker
      begin
        worker = Delayed::Worker.new
        worker.start
      rescue => e
        puts "Error starting Delayed Job worker: #{e.message}"
        puts e.backtrace.join("\n")
      end
    end
  end
  require('letscale_ruby/models/letscale_ruby')
  require('letscale_ruby/config/clock')
end

