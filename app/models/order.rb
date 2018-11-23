class Order < ActiveRecord::Base

    # TYPE
    Uncompleted = 0
    Completed = 1
  
    scope :completed, -> { where(status: [1, 3]) }

    belongs_to :user
    has_many :order_items
    
    def completed?
      [1, 3].include?(self.status)
    end
    
end
