class CLI
    
    def start
        puts "Welcome To Ball Is Life, here you can learn about your favorite NBA teams."
        puts "Let's start with your name:"
        API.get_data
        greet(user_input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Great #{name}!, what team would you like to learn about?"
        puts "Press 'y' to see the list, or 'exit' to leave."
        menu
    end

    def teams_list
        Teams.all.each.with_index(1) do |team, i| 
        puts "#{i}. #{team.name}"
        end
        team_selected
    end

    def goodbye
        puts "Hope you enjoyed learning about your favorite teams! Have a great day and remember BALL IS LIFE! "
        exit
    end

    def invalid
        puts "Hmm, that doesn't seem valid, try again?"
        menu
    end

    def menu 
        selection = user_input
         #puts "Please be patient. "

        if selection == 'y'
            teams_list
            team_selected
        elsif selection == 'exit'
            goodbye
        else invalid
            menu
        end
    end

    def team_selected
        puts 'Enter a number'
        selection = user_input.to_i - 1
        selected_team = Teams.all[selection]
        if selected_team
            team_details(selected_team)
        else 
            invalid
            team_selected
        end 
        #binding.pry
        #selection.to_i-1
    end

end


def team_details(team)
    puts "Name: #{team.name}"
    puts "Conference: #{team.conference}"
    puts "City: #{team.city}"
    puts "Would you like to see more about another team's details? enter 'y' for list or 'exit' if you're finished." 
    menu
end