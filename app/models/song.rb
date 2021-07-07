class Song < ApplicationRecord

    validates :title, presence: true #,  uniqueness: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}    # cannot be repeated by the same artist in the same year
    validates :released,  inclusion: {in: [true, false]}                    # can + msg:  year], message: 'Cannot be repeated by the same artist in the same year.'
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released                  # optional if released==F, not be blank if released==T
    validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}, if: :release_year # <|= current.year
    
end