=begin
economy
- account
- coins
- market
=end

$accounts = Hash.new
admin = {"Shobhit"=>"Shobhit123"}

def createAccount
    # checking already a user or not
    print "Enter a unique username: "
        username = gets.chomp().to_s.downcase
    unless $accounts.has_key?(username)
        print "Enter a unique password: "
        password = gets.chomp().to_s
        $accounts[username] = password
        puts "Sucessfully Created Account."
    else
        puts "Username already exists in the database. Try again!"
    end
end

# default screen options
$options = [
    "1. Create account",
    "2. Admin panel",
    "3. Market",
    "4. Check Balance",
    "5. Check account",
    "6. Exit"
]

BEGIN{
    puts "----------------------------------------Economy----------------------------------------"
}

while true
    $options.each { |i| puts "> #{i}"}
    print "Select an option with no: "
    choosed = gets.chomp.to_i
    if choosed == 6
        puts "Thanks for using"
        break

    elsif choosed == 1
        puts "Creating New Account"
        puts "--------------------------------------------------------------------------------"
        createAccount
        puts "--------------------------------------------------------------------------------"
    end
end

puts $accounts


=begin

def create_resume_file
        random_no = rand(1..10) # to prevent from same name resume's
        unless File.exists?("#{@resume_values["Name"]}#{random_no}.txt")
            @file = File.new("#{@resume_values["Name"]}#{random_no}.txt","w")
            puts "Sucessfully created Resume File with name #{@resume_values["Name"]}#{random_no}.txt"
            puts "adding resume values...."
            puts "================================================"

            # Adding values to the file

            @resume_values.each { |index,entries|
                @file.puts(
                    "#{index}: #{entries}"
                )
            }

        else
            puts "Sprry, File with same name already exists please try again!"

        end
    end

=end
