class Game
  def initialize
    # Initializes the game with two players
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    # Sets the current player index to start with the first player
    @current_index = 0
  end

  # Returns the current player based on @current_index
  def current_player
    @players[@current_index]
  end

  # Switches the current player; cycles between players
  def switch_player
    @current_index = (@current_index + 1) % @players.length
  end

  # Main game loop that runs until a winner is determined
  def play
    # Checks that both players are alive to continue the game
    while @players.all?(&:is_alive?)
      # Generates a new math question
      question = Question.new
      # Asks the current player the question
      question.ask_question(current_player.name) 
      print "> "
      # Gets the answer from the user
      user_answer = gets.chomp.to_i
      # Checks if the answer is correct
      if question.check_answer?(user_answer) 
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        current_player.lose_life # Deducts a life for wrong answer
      end

      # If the current player is out of lives, announce the winner
      unless current_player.is_alive?
        switch_player # Switch to the surviving player announce the winner & lives
        puts "#{current_player.name} wins with a score of #{current_player.lives}/3"
        break
      end
      # Switch to the next player for the next round
      switch_player
    end
  end
end