class Song < ApplicationRecord
    
    validates :artist_name, presence: true
    validates :title, presence: true
    validates :title, uniqueness: { scope: %i[release_year artist_name],
    message: 'cannot create song more than once'
  }
    validates :released, inclusion: { in: [true, false]}

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    end

    def released?
        released
    end
end
