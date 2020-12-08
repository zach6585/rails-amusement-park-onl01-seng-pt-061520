class User < ApplicationRecord
    has_secure_password
    has_many :rides 
    has_many :attractions, through: :rides 
    validates :password_digest, presence: true 
    # validates :name, presence: true 
    # validates :happiness, presence: true 
    # validates :nausea, presence: true  

    def mood
        if self.admin == false && self.valid?
            if self.happiness > self.nausea
                return 'happy'
            else 
                return 'sad'
            end
        else 
            return 'happy' 
        end 
    end 
      
end
