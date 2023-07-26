require 'clockwork'
include Clockwork

every(20.second, 'Sending log') do
  LetscaleRuby::LetscaleRuby.send_log
end
