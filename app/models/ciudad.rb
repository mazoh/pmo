class Ciudad < ActiveRecord::Base
  has_many :formaciones
  has_many :investigaciones
  has_many :academicos

  validates_presence_of :nombre

  def self.search(search)
      if search
        find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
  end

end
