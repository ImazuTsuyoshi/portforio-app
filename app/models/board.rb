class Board < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  has_many :comments, dependent: :delete_all 
  has_many :board_tag_relations, dependent: :delete_all
  has_many :tags, through: :board_tag_relations
  
  


  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }

end
