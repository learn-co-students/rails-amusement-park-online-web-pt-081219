class User < ApplicationRecord
    has_many :rides
    # has_many :attractions, :through => :rides
    has_many :attractions, through: :rides
    has_secure_password
  
    def mood
      if self.nausea && self.happiness
        if self.nausea > self.happiness
          "sad"
        else
          "happy"
        end
      end
    end


    # def mood
    #   if self.happiness < self.nausea
    #     'sad'
    #   elsif self.happiness > self.nausea
    #     'happy'
    #   end
    # end
  




 
  # def is_admin?
  #   return "ADMIN" if self.admin
  # end

end