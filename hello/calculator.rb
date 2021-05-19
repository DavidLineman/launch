# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the 2 numbers
# output the result

def prompt(message)
  $stdout.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to the Calculator!!!")
$stdout.flush

name = ''

loop do
  prompt("What is your name?")
  $stdout.flush
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
    $stdout.flush
  else 
    break
  end
end

prompt("Hi, #{name}")
$stdout.flush

loop do # Main loop
  
  number_one = ''

  loop do 
    prompt("What is the first number?") 
    $stdout.flush
    number_one = gets.chomp

    if valid_number?(number_one)
      break
    else 
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  number_two = ''

  loop do 
    prompt("What is the second number?")
    $stdout.flush
    number_two = gets.chomp

    if valid_number?(number_two)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  answer_prompt = <<-MSG
    What operation would you like to perform?
      1) Add
      2) Subtract
      3) Multiply
      4) Divide
  MSG

  prompt(answer_prompt)
  $stdout.flush

  answer = '' 

  loop do 
    answer = gets.chomp

    if %w(1 2 3 4).include?(answer)
      break
    else 
      prompt("Must choose 1, 2, 3, or 4")
      $stdout.flush
    end
  end


  prompt("#{operation_to_message(answer)} the two numbers...")
  

  result = case answer 
            when '1'
              number_one.to_i + number_two.to_i
            when '2'
              number_one.to_i - number_two.to_i
            when '3'
              number_one.to_i * number_two.to_i
            when '4'
              number_one.to_f / number_two.to_f
            end

  prompt("The result is #{result}")
  $stdout.flush
  prompt("Do you want to perform another calculation? (Y to calcualte again)")
  $stdout.flush

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt("Thank you for using the Calculator")
