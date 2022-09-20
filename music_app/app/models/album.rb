# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  studio_album? :boolean          default(TRUE), not null
#  band_id       :bigint           not null
#  title         :string           not null
#  year          :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Album < ApplicationRecord
    validates :title, presence: true
    validates :year, presence: true
    validates :band_id, presence: true, uniqueness: {scope: :title}
    validates :studio_album?, presence: true

    
    belongs_to :band,
        class_name: :Band,
        foreign_key: :band_id

        
end
