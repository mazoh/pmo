class Especial < ActiveRecord::Base
  has_many :aprendices

  validates_presence_of :nombre

  def self.search(search)
      if search
        find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
  end
end
