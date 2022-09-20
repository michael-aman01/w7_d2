# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :albums,
        class_name: :Album,
        foreign_key: :band_id,
        inverse_of: :band

    def self.find_by_name(name)
        if @band
            @band
        else
            nil
        end
    end

    
end
