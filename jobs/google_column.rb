# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('column_chart', points: [
      ['Day', 'Builds'],
      ['Monday',  1],
      ['Tuesday',  2],
      ['Wednesday',  3],
      ['Thursday',  1],
      ['Friday', 2]
  ])
end