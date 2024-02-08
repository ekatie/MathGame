## Instructions

Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

Both players start with 3 lives. They lose a life if they mis-answer a question. At the end of every turn, the game should output the new scores for both players, so players know where they stand.

The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who won and what the other player’s score is.

## Task 1: Extract Nouns for Classes

- Player
- Game
- Question

## Task 2: Write Their Roles and Details

- Player

  - Role: Represents each participant in the game, holding their state and behavior related to their participation.
  - State:
    - lives: Tracks the number of lives remaining (starting from 3).
    - name: Identifies the player (e.g., Player 1, Player 2).
  - Initialization:
    - Requires name as an argument to distinguish between players.
  - Methods:
    - lose_life(): Decrements the lives count when a player answers incorrectly.
    - is_alive(): Checks if the player still has lives left.
  - User I/O: This class does not directly handle user input or output but is manipulated based on game logic and player input processed elsewhere.

- Game

  - Role: Manages the game flow, including tracking turns, generating questions, and determining the game's end.
  - State:
    - current_player: Tracks who the current player is.
    - players: An array of Player instances.
    - round: Optionally track the current round or turn number.
  - Initialization:
    - Initializes with two Player instances.
  - Methods:
    - play(): Contains the game loop, alternating turns between players until one loses all lives.
    - generate_question(): Generates a new math question for the current turn.
    - switch_player(): Changes the current player after each turn.
    - display_score(): Outputs the scores of both players.
    - game_over(): Announces the winner and the final scores.
  - User I/O: Handles most of the user interaction, including displaying questions, scores, and reading answers.
  - Game Loop: This class contains the main game loop.

- Question

  - Role: Generates a math question and verifies answers.
  - State:
    - number1 and number2: The two numbers involved in the current math question.
    - answer: The correct answer to the current math question.
  - Initialization:
    - Randomly selects number1 and number2 between 1 and 20 upon creation.
  - Methods:
    - ask_question(): Outputs the current math question to the console.
    - check_answer(user_answer): Compares the user's answer to the correct answer.
  - User I/O: Directly involved in outputting questions to the user and processing their input for answers.

## Further Details

- Game Loop: The Game class will contain the game loop, managing the turn-taking mechanism and keeping the game running until a player loses all their lives.
- Current Player Management: The Game class should manage the current_player state, as it controls the flow of the game and needs to keep track of whose turn it is.
- User I/O: The Game and Question classes will handle user input and output. The Game class will manage score displays, game status updates, and player prompts, while the Question class will output questions and verify if the answers are correct. The Player class is more focused on representing player state and does not directly interact with user input or output.
