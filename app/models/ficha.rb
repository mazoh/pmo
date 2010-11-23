class Ficha < ActiveRecord::Base
  has_many :aprendices
  belongs_to :programa

  validates_presence_of :numero

  def self.search(search)
      if search
        find(:all, :conditions => ['numero LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
  end
end
