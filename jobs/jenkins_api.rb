require 'jenkins_api_client'

@client = JenkinsApi::Client.new(:server_ip => '54.86.75.233',
         :username => 'driabwb', :password => '7f5e30e07dca8adfcbd0ef47c78882b9')
# The following call will return all jobs matching 'Testjob'
puts @client.job.list("^sample")
# The following call lists all jobs
puts " THIS IS A LIST OF ALL JOBS"
puts @client.job.list_all











SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('widget_id', { })
end
