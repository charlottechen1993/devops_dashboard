require 'open-uri'
require 'httparty'
# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
  #send_event('widget_id', { })
#    send_event('mychart', points: [
#      ['Year', 'Sales', 'Expenses'],
#      ['2004',  1000,      400],
#      ['2005',  1170,      460],
#      ['2006',  660,       1120],
#      ['2007',  1030,      540]
#  ])
    
    response = HTTParty.get("https://api.github.com/repos/driabwb/devops-dashboard-sample-project/commits?access_token=5cf574c6b259d029d74430fa174936ee9801a9ae")
    
    json = JSON.parse(response.body)
    
    #puts("There are this many commits: ")
    #puts(json.length)
    
    dayhash = Hash.new                              # make new hash for line graph
                                                    # example: {key,value} = {day, # commits}
    
                                                    
    json.reverse.each{|x|                           # iterate backwards through each commit in json response
        currday = x["commit"]["author"]["date"]     # get the current commit's date
        currday = currday[0..-11]                   # round date to nearest day
        
        if dayhash[currday] == nil                  # insert or update # commits per day
            dayhash[currday] = 1
        else
            dayhash[currday] += 1
        end
        
    }
    
    day_points = Array.new                          # create an array of points our actual line chart
    day_points.push(['Day', 'Commits'])
    
    dayhash.each do |key, value|
        day_points.push([key, value])
        puts key + ' : ' + value.to_s
    end
    
    #puts(day_points)
    
    send_event('commits_line_chart', points: day_points)
        
    
end

