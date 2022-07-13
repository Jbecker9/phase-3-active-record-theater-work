class Role < ActiveRecord::Base
    has_many :auditions
    
    def actors
        self.auditions.map {|aud| aud.actor}
    end

    def locations
        self.auditions.map {|aud| aud.location}
    end

    def lead 
        self.auditions.find_by hired: true
    end

    def understudy
        self.auditions.where(hired: true).limit(1).offset(1)
    end

end