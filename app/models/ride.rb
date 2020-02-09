class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        has_tickets = self.user.tickets > self.attraction.tickets ? true : false
        tall_enough = self.user.height > self.attraction.min_height ? true : false

        if has_tickets && tall_enough
            nt = self.user.tickets - self.attraction.tickets
            nn = self.user.nausea + self.attraction.nausea_rating
            nh = self.user.happiness + self.attraction.happiness_rating
            self.user.update(tickets: nt, nausea: nn, happiness: nh)
            "Thanks for riding the #{attraction.name}!"
        elsif tall_enough
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif has_tickets
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        end
    end
end
