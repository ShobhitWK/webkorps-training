require_relative = "resume_modules.rb"

class ResumeGenerator
    def initialize
        @resume_values = Hash.new
        inputs = get_user_inputs()
        create_resume_file
    end

    def get_user_inputs
        inputList = [
            "First Name",
            "Last Name",
            "Gender",
            "Address",
            "Languages",
            "Secondary class marks",
            "Senior secondary class marks"
        ]
        for index in inputList
            print "Enter your #{index}: "
            val = gets.chomp.to_s
            @resume_values[index]=val
        end

        email_validated = true
        dob_validated=true

        while email_validated
            print "Enter your Mail ID: "
            email = gets.chomp.to_s
            if email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
                @resume_values["Mail ID"] = email
                email_validated = false
            else
                puts "Invalid email entered!"
            end
        end

        while dob_validated
            print "Enter your date of birth (yyyy-mm-dd): "
            dob = gets.chomp.to_s
            if dob =~ /\d{4}-(0[1-9]|1[0-2])-/
                @resume_values["Date of Birth"] = dob
                dob_validated=false
            else
                puts "Invalid DOB entered use correct format"
            end
        end
        return @resume_values
    end

    def create_resume_file

        unless File.exists?("#{@resume_values["First Name"]}#{@resume_values["Last Name"]}.txt")
            @file = File.new("#{@resume_values["First Name"]}#{@resume_values["Last Name"]}.txt","w")
            # Adding values to the file
            @file.puts("===========================================Resume=====================================")
            @resume_values.each { |index,entries|
                @file.puts(
                    "=> #{index}: #{entries}"
                )
            }
            @file.puts("======================================================================================")
            puts "Sucessfully created Resume File with name #{@resume_values["First Name"]}#{@resume_values["Last Name"]}.txt"

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
