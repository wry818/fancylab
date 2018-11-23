class User < ActiveRecord::Base
  
  has_and_belongs_to_many :courses,->{where deleted: false}
  
end