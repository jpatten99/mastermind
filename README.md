# mastermind
Ruby basic version of mastermind game (README for instructions)
Player 1 (computer or you) creates a code of numbers 1-6 that is 4 digits in length
Player 2 (opposite choice from above) has 12 turns to guess the secret code "XXXX"
After each guess by player 2, feedback is given by player 1:
  each 0 represents that one number is correct, but not in the correct location
  ex. code = 1234, guess = 2566 --> one 0 will be given since 2 was in both the code and the guess
                                    with location not matching
  ex2 code = 5466, guess = 6132 --> one 0 will be given for the 6 in the guess
  each 1 represents that one number is correct and in the right location
  ex. code = 1234, guess = 6154 --> a 1 will be given since 4 is in correct location! Also a 0 will 
                                    be given for the 1 in the guess                             
