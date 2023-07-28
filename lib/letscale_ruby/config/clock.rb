require 'clockwork'
include Clockwork
Thread.new  do
  every(20.second, 'Sending log') do 
    LetscaleRuby::LetscaleRuby.send_log
  end
end
