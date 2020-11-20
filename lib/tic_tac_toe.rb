class TicTacToe

    attr_accessor :index, :piece

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    
    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "   
    end

    def input_to_index(number)
        @index = number.to_i - 1
    end

    def move(location, piece)
        @board[location] = piece
       
        
    end

    def position_taken?(position)
        if @board[position].include?("X")
            true
        elsif @board[position].include?("O")
            true
        else
            false
        end
    end

    def valid_move?(position)
        position.between?(0, 8) && !position_taken?(position)
    end

    def turn_count
        counter = 0
        @board.each do |i|
            if i == "X" || i == "O"
                counter+=1
            end
        end
        counter
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        input = gets.strip
        num = input_to_index(input)
        if valid_move?(num) 
        piece = current_player
            move(num, piece)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            index1 = combo[0]
            index2 = combo[1]
            index3 = combo[2]

            pos1 = @board[index1]
            pos2 = @board[index2]
            pos3 = @board[index3]

            if pos1 == "X" && pos2 == "X" && pos3 == "X"
                @winner = "X"
                return combo
            elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
                @winner = "O"
                return combo
            end
        end
        return false
    end

    def full?
        if turn_count == 9
            true
        end
    end

    def draw?
        full? && !won?
    end

    def over?
       won? || draw? || full?
    end

    def winner
        if combo = won?
        @board[combo[0]] 
        end 
    end

    def play
        turn until over? 
        if winner
            puts "Congratulations #{winner}!"
        else 
            puts "Cat's Game!"
        end
        
    end
end