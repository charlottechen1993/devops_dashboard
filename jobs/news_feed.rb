require 'httparty'
require 'date'
require 'time'

github_url = 'https://api.github.com/repos/'
repo_owner = 'driabwb'
repo_name = 'devops-dashboard-Sample-Project'


repo_url = 'https://api.github.com/repos/driabwb/devops-dashboard-Sample-Project/commits?access_token=d3718ad0b708998022d2fe23b7486799e0f59e65'

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|

  total_url = github_url + repo_owner + '/' + repo_name + "/commits?access_token=d3718ad0b708998022d2fe23b7486799e0f59e65"

  # puts ("YAYYYYAYAYYAYYA")

  # puts total_url
  response = HTTParty.get(total_url)
  json = JSON.parse(response.body)

  # puts(json)

  data = []

  counter = 0

json.take(5).each do |x|
    name = x["commit"]["author"]["name"]
    date = x["commit"]["author"]["date"]
    comment = x["commit"]["message"]

    # puts DateTime.strptime(date, '%m/%d/%Y %H:%M:%S')

    # puts name

    commitObject = Hash.new
    commitObject["label"] = name
    commitObject["value"] = Time.parse(date)

    # puts commitObject

    data.push(commitObject)

    # puts "Date: #{data.date[0]}"
  end


  send_event('news_feed', {
    items: data
  })

end
