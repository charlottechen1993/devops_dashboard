# Populate the graph with some random points
points = []
(1..10).each do |i|
  points << { x: i, y: rand(50) }
end
last_x = points.last[:x]

require 'net/http'
require 'json'
 
url = 'https://api.github.com/repos/driabwb/devops-dashboard-sample-project/commits?access_token=5cf574c6b259d029d74430fa174936ee9801a9ae'
uri = URI(url)
response = Net::HTTP.get(uri)
puts(JSON.parse(response).length)


SCHEDULER.every '2s' do
  points.shift
  last_x += 1
  points << { x: last_x, y: rand(50) }

  send_event('github_graph', points: points)
end

