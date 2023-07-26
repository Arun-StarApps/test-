# frozen_string_literal: true



module LetscaleRuby
  require('rake')
  require('clockwork')
  require('letscale_ruby/models/letscale_ruby')
  require('letscale_ruby/config/clock')
  require('letscale_ruby/railtie') 
  load 'letscale_ruby/lib/tasks/clockwork.rake'

end
