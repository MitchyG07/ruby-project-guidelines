require 'rest-client'

class Activity < ActiveRecord::Base
    belongs_to :tourist
    belongs_to :nationalpark

    def self.find_park_by_activity(activity)
        res = GetRequester.new("https://developer.nps.gov/api/v1/activities/parks?q=#{activity}&api_key=amSoAnSXu48zw8sNc45tsop4Wriei2yPYPM8hrBJ")
        activity_data = res.parse_json["data"][0]["parks"]
        activity_data.map do |np|
            np["fullName"]
        end 
    end 


    def self.list_all_activities
        res = GetRequester.new("https://developer.nps.gov/api/v1/activities/parks?api_key=amSoAnSXu48zw8sNc45tsop4Wriei2yPYPM8hrBJ")
        activity_data = res.parse_json["data"]
        activity_data.map do |act|
            act["name"]
        end 
    end 
end 

# ["Arts and Culture",
#     "Astronomy",
#     "Auto and ATV",
#     "Biking",
#     "Boating",
#     "Camping",
#     "Canyoneering",
#     "Caving",
#     "Climbing",
#     "Compass and GPS",
#     "Dog Sledding",
#     "Fishing",
#     "Flying",
#     "Food",
#     "Golfing",
#     "Guided Tours",
#     "Hands-On",
#     "Hiking",
#     "Horse Trekking",
#     "Hunting and Gathering",
#     "Ice Skating",
#     "Junior Ranger Program",
#     "Living History",
#     "Museum Exhibits",
#     "Paddling",
#     "Park Film",
#     "Playground",
#     "SCUBA Diving",
#     "Shopping",
#     "Skiing",
#     "Snorkeling",
#     "Snow Play",
#     "Snowmobiling",
#     "Snowshoeing",
#     "Surfing",
#     "Swimming",
#     "Team Sports",
#     "Tubing",
#     "Water Skiing",
#     "Wildlife Watching"]