class Centro < ActiveRecord::Base
  has_many :docentes

  validates_presence_of :name

  def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
  end

end
