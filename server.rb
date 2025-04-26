require 'drb/websocket'

class CommentBoard
  attr_reader :comments

  def initialize
    @comments = []
  end

  def add(comment)
    @comments << comment
  end
end

board = CommentBoard.new

DRb.start_service('drbws://localhost:8787', board)

puts "Server running at drbws://localhost:8787"
DRb.thread.join