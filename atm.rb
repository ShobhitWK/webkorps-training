class ATM

    def initialize
        change_amount = get_input()
        if change_amount.is_a?(Integer) && change_amount.to_i > 0 # validating input
            final_ans = final(change_amount)
            for i in final_ans # iterating through the hash
                puts "> #{i[0]}: #{i[1]}\n"
            end
            puts "==================================================="
        else
            puts "There's a problem in your input please try again!"
            puts "==================================================="
        end
    end

    def final(coins) # final function for sorthing the change

        change = Hash.new

        while coins > 0

            if coins >= 25
                change["Quater"] = coins/25
                coins = coins%25
            elsif coins >= 10
                change["Dime"] = coins/10
                coins = coins%10
            elsif coins >= 5
                change["Nickel"] =  coins/5
                coins = coins%5
            else
                change["Penny"] = coins/1
                coins = coins%1
            end

        end

        return change
    end

    def get_input # to take input
        print "Enter the amount you want to withdraw: "
        coins = gets.chomp().to_i
        puts "==================================================="
        return coins
    end
end

while true # Running infinite loop for continious usage of machine
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
