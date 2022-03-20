class Mastermind
  def initialize
    @code = Array.new(4)
    @code_shell = Array.new(4)
    @guess = Array.new(4)
    @hints = Array.new
    @turn_counter = 0
    @continue_game = true
    @hint_given = false
    @mode_choice
  end

  def comp_create_code
    for i in 0..@code.length-1 do
      @code[i] = rand(1..6)
    end
    #p @code
  end

  def hard_code(a, b, c, d)
    @code[0] = a
    @code[1] = b
    @code[2] = c
    @code[3] = d
  end

    

  def player_guess_code(input)
    #don't want input unless its a four digit code
    if input.length == 4
      
      @guess = input.chars
      for i in 0..3 do
        @guess[i] = @guess[i].to_i
        #don't want guesses containing anything other than 1-6
        if @guess[i] > 6 || @guess[i] < 1
           puts "invalid input, turn not counted"
          return
        end
      end
      if @guess == @code
        puts "You win!"
        exit(true)
      end
      #@code_shell is a code of code that can be changed for certain scenarios such as 
      #avoiding repeating hints for numbers or replacing a 0 hint with a 1 hint
      #since 1 should take precendence over 0
      #EX-- code =1234, guess = 2344 should return 0, 0, 1 not 0, 0, 0
      @code_shell = @code
      @code_shell.each_with_index do |codeEL, codeIND|
        @guess.each_with_index do |guessEL, guessIND|
          if codeEL == guessEL
            if codeIND == guessIND
              @hints.push(1)
              codeEL = 0
            else
              @hints.push(0)
              codeEL = -(codeEL.abs)
            end
          #this replaces 0 with 1 in the necessary cases 
          elsif codeEL < 0 && codeIND == guessIND
            if codeEL.abs == guessEL.abs
              @hints.pop
              @hints.push(1)
            end
          end
        end
      end
      puts "Remember 0 means one right # in the wrong spot, 1 means one # in right spot\nHints:"
      p @hints
      for i in 0..3 do
        @hints.pop
      end
      @turn_counter += 1
    else
      puts "invalid input, turn not counted"
    end
  end

  def start_game
    while @mode_choice != "1" && @mode_choice != "2"
      puts "Choose game mode type:\nEnter 1 to be the code guesser \nEnter 2 to be the code creator"
      @mode_choice = gets.chomp
    end
    if @mode_choice == "1"
      hard_code(1, 2, 3, 4)
      while @continue_game
        puts "\nTurn number: #{@turn_counter + 1}"
        puts "Enter next guess:"
        player_guess_code(gets.chomp)
        if @turn_counter == 12
          puts "Code maker wins"
          @continue_game = false
        end
      end
    elsif @mode_choice == "2"
      #code creator mode goes here
      
      #return
    end
    
  end
end

test = Mastermind.new
#test.player_guess_code("1234")
test.start_game