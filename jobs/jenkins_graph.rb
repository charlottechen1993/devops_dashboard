#intended to populate graph with the amount of jenkins builds per day & total num of jenkins builds
points = []
(1..10).each do |i|
  points << { x: i, y: rand(50) }
end
last_x = points.last[:x]

SCHEDULER.every '2s' do
  points.shift
  last_x += 1
  points << { x: last_x, y: rand(50) }

  send_event('jenkins_graph', points: points)
end