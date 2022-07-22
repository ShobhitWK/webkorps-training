require_relative = "resume_modules.rb"

class ResumeGenerator
    def initialize
        @resume_values = Hash.new
        inputs = get_user_inputs()
        create_resume_file
    end

    def get_user_inputs
        inputList = [
            "Name",
            "Dob",
            "Gender",
            "Address",
            "Mail ID",
            "Contact",
            "Languages",
            "Secondary class marks",
            "Senior Secondary class marks"
        ]
        for index in inputList
            print "Enter your #{index}: "
            val = gets.chomp.to_s
            @resume_values[index]=val
        end
        return @resume_values
    end

    def create_resume_file

        unless File.exists?("#{@resume_values["Name"]}.txt")
            @file = File.new("#{@resume_values["Name"]}.txt","w")
            # Adding values to the file
            @file.puts("===========================================Resume=====================================")
            @resume_values.each { |index,entries|
                @file.puts(
                    "#{index}: #{entries}"
                )
            }
            @file.puts("======================================================================================")
            puts "Sucessfully created Resume File with name #{@resume_values["Name"]}.txt"

        else
            puts "Sorry, File with same name already exists please try again!"

        end
    end
end

ResumeGenerator.new

BEGIN{
    puts "===================================Resume Generator================================="
}

END{
    puts "===================================================================================="
}
