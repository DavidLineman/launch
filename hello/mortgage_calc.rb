
def prompt(message)
  $stdout.puts("#{message}")
end

def monthly_interest_rate(apr)
  apr / 12
end

def loan_length(loan_term)
  loan_term / 12
end

def monthly_payment(loan_length, monthly_interest_rate)
  loan_length * monthly_interest_rate
end

prompt("Welcome to the mortgage calculator!!")
$stdout.flush

prompt("How much would you like to borrow?")
$stdout.flush

amount = gets.chomp

$stdout.puts "What percent is the APR?"
$stdout.flush

apr = gets.chomp.to_f

$stdout.puts "The monthly inerest rate will be #{monthly_interest_rate(apr)}"


$stdout.puts "What is the length of the loan in years? (15 or 30 years)"
$stdout.flush

term = gets.chomp.to_f
