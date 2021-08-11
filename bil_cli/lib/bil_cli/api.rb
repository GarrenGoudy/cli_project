class API

    def self.get_data
        response = RestClient.get('https://www.balldontlie.io/api/v1/teams')
        teams_array = JSON.parse!(response)["data"]
        teams_array.each do |teams|
            Teams.new(teams["name"], teams["conference"], teams["city"])
        end
    
    end
    


   end
   