class ATM

    def initialize

        @currencies = {25=>"Quater",10=>"Dime",5=>"Nickel",1=>"Penny"} # Making a Hash with Default Values of Currencies

        change_amount = get_input()

        # Validating Input

        if change_amount.is_a?(Integer) && change_amount.to_i > 0
            final_ans = final(change_amount)
            final_ans.each { |currency,value| puts "> #{currency}: #{value}" }
            puts "==================================================="
        else
            puts "There's a problem in your input please try again!"
            puts "==================================================="
        end
    end

    # Final Function for Sorting the Change_Amount

    def final(change_amount)

        change = Hash.new

        @currencies.each { |coin,currency_name|
            if change_amount >= coin.to_i
                change[currency_name] = change_amount/coin.to_i
                change_amount=change_amount%coin.to_i
            end
        }

        return change
    end

    # Function to take Input

    def get_input
        print "Enter the amount you want to withdraw: "
        coins = gets.chomp().to_i
        puts "==================================================="
        return coins
    end
end

# Running infinite loop for continious usage of machine

while true
    print "Do you want to use atm? [y/n]: "
    response = gets.chomp.to_s

    if response == 'y' or response == 'Y'
        ATM.new()

    elsif response == 'n' or response == 'N'
        puts "Stopping the machine..."
        break

    else
        puts "Invalid Input! \n==================================================="
    end
end

BEGIN{
    puts "========================ATM========================"
}
END{
    puts "==================================================="
}
