require 'jenkins_api_client'

@client = JenkinsApi::Client.new(:server_ip => '54.86.75.233',
         :username => 'driabwb', :password => '7f5e30e07dca8adfcbd0ef47c78882b9')

puts "---=========== ROBERT'S JENKINS API DEBUGGING PLAYGROUND ===========--"

puts "List of all jobs in targeted jenkins account"
job_list = @client.job.list_all
puts job_list
puts "There are ["+job_list.length.to_s+"] total jobs for this account"

puts "\nList of all jobs in targeted jenkins account - with all details (JSON)"
listall_hash = @client.job.list_all_with_details
puts listall_hash

puts "\nIterate through job_list and display get_builds for each one"
build_deets = Array.new(job_list.length)
test1 = @client.job.get_builds(job_list[0],{})
test2 = @client.job.get_builds(job_list[1],{})
puts test1
puts test2
#for i in 0..job_list.length
#  build_deets.push(@client.job.get_builds(job_list[i],{}))
#end


#@client.job.get_build_details(jobname,buildnumber)
#get_builds(job_name, options = {}) ⇒ Object
#get_config(job_name) ⇒ String
#get_current_build_number(job_name) ⇒ Integer (also: #build_number)
#get_current_build_status(job_name) ⇒ String (also: #status)
#get_test_results(job_name, build_num) ⇒ Object
#list_by_status(status, jobs = []) ⇒ Array<String>
#list_details(job_name) ⇒ Hash
#list_details(job_name) ⇒ Hash




puts "---=========== /ROBERT'S JENKINS API DEBUGGING PLAYGROUND ===========--"










SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('widget_id', { })
end
