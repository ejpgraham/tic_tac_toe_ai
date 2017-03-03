require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :next_mover_mark, :prev_move_pos
  attr_reader :board

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    posssible_moves = []
    board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        posssible_moves << [i,j] if board.empty?([i,j])
      end
    end
    children = []
    posssible_moves.each do |pos|
      if next_mover_mark == :x
        next_mover_mark = :o
      else
        next_mover_mark = :x
      end
      children << TicTacToeNode.new(board.dup, next_mover_mark, pos)
    end
    children
  end
end
