class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: 'cannot be repeated by the same artist in the same year'
}

  validates :artist_name, presence: true
  
  validates :released, inclusion: { in: [true, false]}



  with_options if: :released? do |song|
    song.validates :release_year, presence:true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end
# Title:
# Cannot be repeated by the same artist in the same year

# Released:
# Must be true or false

# Released_year
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year




end
