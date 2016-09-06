require 'jenkins_api_client'
require 'awesome_print'

@client = JenkinsApi::Client.new(:server_ip => '54.86.75.233',
         :username => 'driabwb', :password => '7f5e30e07dca8adfcbd0ef47c78882b9')

puts "\n\n---=========== ROBERT'S JENKINS API DEBUGGING PLAYGROUND ===========--"

puts "Getting jobs from target jenkins server..."
job_list = @client.job.list_all
ap job_list
puts "-->There are ["+job_list.length.to_s+"] total jobs for this account"

puts "Getting all jobs in targeted jenkins account - with all details (JSON)\n--> OK"
listall_hash = @client.job.list_all_with_details
#ap listall_hash

puts "Creating generalized build details hash per jenkinns job...\n-->OK"
#puts "This will construct a 3d(ish) hash of all jobs and all build deets"
build_deets = Hash.new #Instantiate hash table
job_list.each{|i| build_deets[i]=@client.job.get_builds(i,{})}
#ap  build_deets

puts "Determine build status for each job...\n-->OK"
current_build_status = Hash.new
job_list.each{|i| current_build_status[i]=@client.job.get_current_build_status(i)}
#ap current_build_status

puts "Fetching build time information...\n-->OK"
all_build_info = {}
build_deets.each do |job,deetsarray|
  temparray = []
  for jobdeets in 0..deetsarray.length-1
    temparray.push(@client.job.get_test_results(job,jobdeets+1))
  end
  all_build_info.store(job,temparray)
end
#ap all_build_info

#p @client.job.get_test_results(job_list[0],5)
#ADDITIONAL FUNCTIONS TO TEST/IMPLEMENT
#@client.job.get_build_details(jobname,buildnumber)
#get_builds(job_name, options = {}) ⇒ Object
#get_current_build_number(job_name) ⇒ Integer (also: #build_number) !!
#get_current_build_status(job_name) ⇒ String (also: #status) !!
#get_test_results(job_name, build_num) ⇒ Object !!
#list_by_status(status, jobs = []) ⇒ Array<String>
#list_details(job_name) ⇒ Hash



puts "\n\n---=========== ROBERT'S JENKINS API DEBUGGING PLAYGROUND ===========--"
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('widget_id', { })
end
