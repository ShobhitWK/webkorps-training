require_relative("currency.rb")

class ATM
    include StartMethod
    include FinalChange
    include TakeInput
end



BEGIN{
    puts "========================ATM========================"
}

include Infinity

infiniteTimes()

END{
    puts "==================================================="
}
