class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user
    def take_ride 
        a = ""
        if self.user.tickets < self.attraction.tickets 
            a += "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if self.user.height < self.attraction.min_height
            if a != ""
                a += " You are not tall enough to ride the #{self.attraction.name}."
            else 
                a += "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            end 
        end 
        if a != ""
            return a
        else 
            user = User.find(self.user_id)
            # binding.pry
            user.tickets -= self.attraction.tickets
            user.nausea += self.attraction.nausea_rating
            user.happiness += self.attraction.happiness_rating
            user2 = User.find(self.user_id)
            User.delete(self.user_id)
            @a = User.create!(user.attributes)

            return "Thanks for riding the #{self.attraction.name.titleize}!"
        end 
    end 
end
