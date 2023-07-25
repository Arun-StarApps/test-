require 'clockwork'
include Clockwork
require 'net/http'
module LogGenerator
    class LogGenerator < ActiveRecord::Base
        self.table_name = 'delayed_jobs'
        
        def self.send_log 
            token = ENV['LOG_TOKEN']
            unless  token
              return
            end
            job_count = LogGenerator.where("
                run_at + interval '5 seconds' < NOW() AT TIME ZONE 'utc'
                AND priority >= 6
                AND locked_at IS NULL
                AND attempts < 10
              ").count
            url = URI.parse("https://letscale-dev-49b31de4a60b.herokuapp.com/sys-logs")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            request = Net::HTTP::Post.new(url.path)
            request['Content-Type'] = 'application/json'
            request['Accept'] = 'application/vnd.heroku+json; version=3'
            request['LOGPLEX_DRAIN_TOKEN'] = token
            jobs = {
                job_count:  job_count,
            }
            request.body = jobs.to_json
            response = http.request(request)
        end

               
    end
end
  