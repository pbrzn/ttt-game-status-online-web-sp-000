# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS=[
  [0,1,2], [3,4,5], [6,7,8], 
  [0,3,6], [1,4,7], [2,5,8], 
  [0,4,8], [2,4,6]
  ]
  
def won?(board)
  WIN_COMBINATIONS.detect do |winning_spots|
    if winning_spots.all? {|index| board[index]=="X"}
      winning_spots
    elsif winning_spots.all? {|index| board[index]=="O"}
      winning_spots
    else
      nil
    end
  end
end

def full?(board)
  board.all? do |index|
    index=="X" || index=="O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    if won?(board).detect {|index| board[index]=="X"}
      return "X"
    else
      return "O"
    end
  else
    nil
  end
end
    