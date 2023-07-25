require 'clockwork'
include Clockwork

every(1.second, 'Sending log') do
  LogGenerator::LogGenerator.send_log
end
