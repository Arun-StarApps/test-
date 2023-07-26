require 'clockwork'
include Clockwork

every(1.second, 'Sending log') do
  LetscaleRuby::LetscaleRuby.send_log
end
