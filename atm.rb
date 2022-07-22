class ATM

    def initialize

        @c = {25=>"Quater",10=>"Dime",5=>"Nickel",1=>"Penny"}

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

    def final(coins) # final function for sorting the change

        change = Hash.new

        for i in @c.keys
            if coins >= i.to_i
                change[@c[i]] = coins/i.to_i
                coins=coins%i.to_i
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
