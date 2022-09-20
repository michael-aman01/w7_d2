class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    def self.find_by_name(name)
        if @band
            @band
        else
            nil
        end
    end

    
end
