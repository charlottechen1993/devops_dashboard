require 'open-uri'
require 'httparty'
require 'sinatra'
require 'json/ext'
require 'active_support/core_ext'


=begin
##########################################
# Scheduler method (unused)
SCHEDULER.every '5s', :first_in => 0 do |job|
    # dont do anything?
end
=end


##########################################
# Webhook handler
# receives POSTs to localhost:[PORT]/payload
post '/payload' do
    puts "================================================================================"
    puts "[WEBHOOK] JSON received to \'/payload\'"
    parsedRequest = parseJSON(request)                          # Parse the JSON request to a Ruby-usuable format
    puts "[WEBHOOK] Parsed JSON: #{parsedRequest.inspect}"
    convertedRequest = convJSONtoPoints(parsedRequest)          # Convert the parsed request to line graph format
    puts "[WEBHOOK] Extracted data: #{convertedRequest}"
    send_event('commits_line_chart', points: convertedRequest)  # Send the line graph to the chart
    puts "================================================================================"
end

##########################################
# Method to parse JSON
def parseJSON(data)
    return JSON.parse data.body.read
end

##########################################
# Function to read Github JSON
# and convert to line graph data format
def convJSONtoPoints(json)

    # Step 1 - Iterate through JSON and create hash of {day:#commits} pairs
    dayhash = Hash.new                  

    json["commits"].reverse.each{|x|        # commits are most recent first, so reverse them
        currday = x["timestamp"]                    
        currday = currday[0..-16]           # round date to nearest day

        if dayhash[currday] == nil          # insert or update num commits per day
            dayhash[currday] = 1
        else
            dayhash[currday] += 1
        end
    }

    # Step 2 - Convert hash to array in format of Google Line Chart
    day_points = Array.new                          
    day_points.push(['Day', 'Commits'])

    dayhash.each{|key, value|
        day_points.push([key, value])
    }
    
    return day_points
end


