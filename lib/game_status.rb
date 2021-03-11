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
  if draw?(board)
    return false
  else
    WIN_COMBINATIONS.detect do |winning_spots|
      winning_spots.all? do |index|
        board[index]=="X" && board[index]!="O" || board[index]=="O" && board[index]!="X"
      end
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