require 'clockwork'

module Clockwork

  handler do |job|
    case job
    when 'send_log'
      LetscaleRuby::LetscaleRuby.send_log
    end
  end

  every(20.seconds, 'send_log')
end