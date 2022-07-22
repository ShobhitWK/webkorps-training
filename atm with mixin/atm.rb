require_relative("currency.rb")

class ATM
    include StartMethod
    include FinalChange
    include TakeInput
end

include InfinityLoop

userResp()

BEGIN{
    puts "========================ATM========================"
}

END{
    puts "==================================================="
}
