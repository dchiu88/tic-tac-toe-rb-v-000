WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left Row
  [1,4,7], #Center Row
  [2,5,8], #Right Row
  [0,4,8], #Incline diagonals
  [6,4,2], #Decline diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
      true
    end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

def current_player
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
  board[combo[0]] == board[combo[1]] &&
  board[combo[1]] == board[combo[2]] &&
  position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def play(board)
  input = gets
end
