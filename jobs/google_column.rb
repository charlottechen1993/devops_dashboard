# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('column_chart', points: [
      ['Day', 'Builds'],
      ['Monday',  100],
      ['Tuesday',  56],
      ['Wednesday',  169],
      ['Thursday',  103],
      ['Friday', 78]
  ])
end