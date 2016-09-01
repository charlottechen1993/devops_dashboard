require 'trello'

include Trello

Trello.configure do |config|
  config.developer_public_key = '42e232137e575ecffde5c12551b03979'
  config.member_token = '228530f9a747f1196bb5f363ee0b5101d5b17f37942521eb2229ca1359ac7bbf'
end

boards = {
  "my-trello-board" => "FRQcnUen",
}

class MyTrello
  def initialize(widget_id, board_id)
    @widget_id = widget_id
    @board_id = board_id
  end

  def widget_id()
    @widget_id
  end

  def board_id()
    @board_id
  end

  def status_list()
    status = Array.new
    Board.find(@board_id).lists.each do |list|
      status.push({label: list.name, value: list.cards.size})
    end
    status
  end
end

@MyTrello = []
boards.each do |widget_id, board_id|
  begin
    @MyTrello.push(MyTrello.new(widget_id, board_id))
  rescue Exception => e
    puts e.to_s
  end
end

SCHEDULER.every '5m', :first_in => 0 do |job|
  @MyTrello.each do |board|
    status = board.status_list()
    send_event(board.widget_id, { :items => status })
  end
end