require 'jenkins_api_client'

@client = JenkinsApi::Client.new(:server_ip => '54.86.75.233',
         :username => 'driabwb', :password => '7f5e30e07dca8adfcbd0ef47c78882b9')
# The following call will return all jobs matching 'Testjob'
puts @client.job.list("^sample")
# The following call lists all jobs
puts "---=========== ROBERT'S JENKINS API DEBUGGING PLAYGROUND ===========--"
puts "List of all jobs in targeted jenkins account"
puts @client.job.list_all
puts "List of all jobs in targeted jenkins account - with all details (JSON)"
listallhash = @client.job.list_all_with_details
puts listallhash
puts "Test of color to status. This should be blue"
# puts 






puts "---=========== /ROBERT'S JENKINS API DEBUGGING PLAYGROUND ===========--"










SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('widget_id', { })
end
