# frozen_string_literal: true
module LetscaleRuby

  class Railtie < Rails::Railtie
    config.after_initialize do
      dyno = ENV["DYNO"]
      if dyno&.start_with?("worker") &&  dyno.split(".")[1].to_i == 1 &&  ENV["IS_MIRROR"].present?
        Clockwork.run
      end
    end
  end
  require('letscale_ruby/models/letscale_ruby')
  require('letscale_ruby/config/clock')
end
