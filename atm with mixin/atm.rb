require_relative("currency.rb")

class ATM
    include StartMethod
    include FinalChange
    include TakeInput
end

include Infinity

infiniteTimes()

BEGIN{
    puts "========================ATM========================"
}

END{
    puts "==================================================="
}
