require_relative 'api.rb'
require_relative 'scraper.rb'
require_relative 'user.rb'

class CLI
# run
  def run 
    User.load_useser_from_file
    authenticate 
    Scraper.scrape_classes
    greeting
    while menu != 'exit'
    end
    goodbye
  end
# greeting
  def greeting
    puts "Welcome to the Honors Pathway for Graduation!"
  end
  # end program  
  def goodbye
    puts "Thank you for using the Honors Pathway for Graduation, Good Luck!"
  end  
# menu
  def menu
    list_options
    input = gets.chomp.downcase
    choose_option(input)
    input
  end

  # List of options
  def list_options
    puts 'Please select from the following options:'
    puts '1. List all Math classes'
    puts '2. List all Language Arts classes'
    puts '3. List all Fine Arts classes'
    puts '4. List all History/Social Studies classes'
    puts '5. List all Science classes'
    puts '6. List all Technology classes'
    puts '7. List all foreign Lanuguage classes'
    puts '8. List all Health/Social & Emotional classes'
    puts '9. List all Career & Technical Education classes'
    puts "Exit the program by entering 'Exit'"
  end

# Choose Option breakdown
  def choose_option(option)
    case option
      when '1'
        puts 'Math Classes'
        puts Scraper.all
        puts '----------------'
       
      when '2'
        puts 'Language Arts Classes'
        puts Scraper.all 
        puts '----------------'
       
      when '3'
        puts 'Fine Arts Classes'
        puts Scraper.all
        puts '----------------'
       
      when '4'
        puts 'History/Social Studies Classes'
      
      when '5'
        puts 'Science Classes'
    
      when '6'
        puts 'Technology Classes'
    
      when '7'
        puts 'Foreign Language Classes'
    
      when '8'
        puts 'Health/Social & Emotional Classes'
  
      when '9'
        puts 'Career & Technical Education Classes'
  
      when 'exit'
        puts 'Thank you for using the Honors Pathway for Graduation!'
      end
  end
  def authenticate
    authenticated = false

    until authenticated
      puts "Please login or signup"
      puts "Which do you choose? (sign up/login)"
      get_input = gets.chomp
      if get_input == 'login'
        # authenticate user
        authenticated = login
      elsif get_input == 'sign up'
        # create account process
        create_account
      else 
        puts "Please enter a valid option."
    end
  end
end
  def login
    puts "Please enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp

  # call authenticate from user class
    result = User.authenticate(username, password)
    if result
      puts "Welcome back #{username}"
    else
      puts "Invalid username or password"
    end
    result 
  end

  def create_account
    # get user info
    puts "Please enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp

    user = User.new(username, password)
    # add the user to an external file
    User.store_credentials(user)
    puts "Account created successfully!"
  end
end
    
