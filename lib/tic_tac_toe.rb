class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(position, character)
  @board[position] = character
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end

def valid_move?(index)
  if index.between?(0, 8) && position_taken?(index) == false
    true
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player
  if valid_move?(index)
    move(index, character)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |character|
    if character == "X" || character == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  false
end

def full?
  if @board.all? do |character|
      character == "X" || character == "O"
    end
    true
  else
    false
  end
end

def draw?
  if full? && !won?
    true
  else
    false
  end
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  if won?
    @board[won?[0]]
  else
    nil
  end
end

def play
  until over? do
    turn
  end  # lines 123 - 125 can be combined in one line: turn(board) until over?(board)
  if draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
  end
end

end
