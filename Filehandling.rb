class FileHandling

    def createFile(fileName)
        unless File.exists?("#{fileName}")
            file = File.new("#{fileName}","w")
            puts "File Sucessfully Created with name #{fileName}"
            puts '===================================================================='
            print 'Do you want to add something in the file [y/n]: '
            chose = gets.chomp.to_s
            if chose == "y"
                puts "How many lines you want to enter: "
                value = gets.chomp.to_i
                file = File.open("#{fileName}","a")
                for i in 1..value
                    print "Enter value of line #{i}: "
                    val = gets.chomp.to_s
                    file.puts(val)
                end
                puts "============================================================================="


            else
                puts "Exiting Code"
                return
            end
    else
        puts "File with the same name already exists. \n===================================================================="
    end
    end

    def readFile(fileName)
        begin
        file = File.open("#{fileName}","r")
        puts "Reading file #{fileName} \n========================================================================"
        for line in file.readlines
            puts line
        end
        puts "================================================================================="
        rescue
            puts "Error while checking for file directory!"
            puts "============================================================================="

    end
    end

end

options = [
    "1. Create file",
    "2. Read",
    "3. Write",
    "4. exit"
]

obj = FileHandling.new
while true
options.each { |i| puts i }

print "What operation you want to apply [1-4]: "
userResponse = gets.chomp.to_i

puts "============================================================================="


case userResponse
when 1
    print "Enter file name with extention: "
    fileName = gets.chomp.to_s
    obj.createFile(fileName)

when 2
    print "Enter file name with extention: "
    fileName = gets.chomp.to_s
    obj.readFile(fileName)

when 3
    puts "1. Append"
    puts "2. Overrite"
    puts "3. Clear File and write"
    puts "4. Exit"
    print "Select any option for writing: "
    val = gets.chomp.to_i
    case val
    when 1
        print "Enter file name with extention: "
        fileName = gets.chomp.to_s
        obj.fileWriteAppend(fileName)
    when 2
        print "Enter file name with extention: "
        fileName = gets.chomp.to_s
        obj.fileWriteOverrite(fileName)
    when 3
        print "Enter file name with extention: "
        fileName = gets.chomp.to_s
        obj.fileWriteNew(fileName)
    when 4
        puts "Exting write mode"
        puts "============================================================================="
        next
    end

when 4
    puts "Thank you!"
    break
end
end

BEGIN{
    puts "================================File Handling================================"
}
END{
    puts "============================================================================="

}
