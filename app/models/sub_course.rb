class SubCourse < ActiveRecord::Base
  
  # TYPE
  Graphic = 1
  Video = 2
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  paginates_per 12

  has_and_belongs_to_many :courses
  
  scope :isnot_deleted,->{where(deleted:false)}
  
  def slug_candidates
    [
      :title,
      [:title, :title_count],
      [:title, :title_count, :title_random]
    ]
  end
  
end