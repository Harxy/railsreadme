class Note < ActiveRecord::Base
  validates :title, presence: true
  validates :priority, 
            numericality: { greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 3
                          }
  validates :contents, length: { maximum: 500 }

  def showing_order
    priority * time_since_seen
  end

  def time_since_seen
    (Date.today - date_last_viewed).to_i
  end
end
