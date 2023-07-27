# frozen_string_literal: true
module LetscaleRuby

  class Initializer
    def self.run
      unless LetscaleRuby.find_by(queue: 'sendLetscaleLog')
        LetscaleRuby.start_log
      end
    end
  end

  class Railtie < Rails::Railtie
    config.after_initialize do
      Initializer.run
    end
  end
  require('letscale_ruby/models/letscale_ruby')

end
