# frozen_string_literal: true



module LogGenerator
  require('rake')
  require('clockwork')
  require('log_generator/models/log_generator')
  require('log_generator/config/clock')
  require('log_generator/railtie') 
  load 'log_generator/lib/tasks/clockwork.rake'

end
