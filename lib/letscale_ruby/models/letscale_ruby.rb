module LetscaleRuby
    class LetscaleRuby < ActiveRecord::Base
        self.table_name = 'delayed_jobs'
        
        def self.send_log 
            token = ENV['LETSCALE_API_TOKEN']
            unless  token
              return
            end
            job_count = LetscaleRuby.where("
                run_at + interval '5 seconds' < ?
                AND priority >= 6
                AND locked_at IS NULL
                AND attempts < 10
                ", Time.zone.now
            ).count
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

        def self.restart_dynos
            token = ENV['LETSCALE_API_TOKEN']
            unless  token
              return
            end
            url = URI.parse("https://letscale-dev-49b31de4a60b.herokuapp.com/restart_dynos")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            request = Net::HTTP::Post.new(url.path)
            request['Content-Type'] = 'application/json'
            request['Accept'] = 'application/vnd.heroku+json; version=3'
            request['LOGPLEX_DRAIN_TOKEN'] = token
            response = http.request(request)
        end
    end
end