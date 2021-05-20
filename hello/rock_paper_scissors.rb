VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  $stdout.puts "=> #{message}"
  $stdout.flush
end

def win?(first, second)
  (first == 'rock' && second == 'scissors' || second == 'lizard') ||
  (first == 'scissors' && second == 'paper' || second == 'lizard') ||
  (first =='paper' && second == 'rock' || second == 'spock') ||
  (first == 'lizard' && second == 'paper' || second == 'spock') ||
  (first == 'spock' && second == 'scissors' || second == 'rock')
end

def display_message(player, computer)
  if win?(player, computer)
    prompt("You win")
  elsif win?(computer, player)
    prompt("You lose!")
  else 
    prompt('It is a tie')
  end
end


loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else 
      prompt("That is not a valid choice")
    end
  end

  computer_choice = ["rock", "paper", "scissors", "lizard", "spock"].sample

  prompt("You chose #{choice}, Computer chose #{computer_choice}")

  display_message(choice, computer_choice)

  prompt("Do you want to play again? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt("Thanks for playing. Good Bye!")