class Course < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  has_and_belongs_to_many :sub_courses,->{where deleted: false}
  has_and_belongs_to_many :users
  
  def slug_candidates
    [
      :title,
      [:title, :title_count],
      [:title, :title_count, :title_random]
    ]
  end
  
  def title_count
    Course.where(:title=>self.title).count
  end
  
  def title_random
    rand(1..9)
  end
  
end