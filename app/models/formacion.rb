class Formacion < ActiveRecord::Base
  belongs_to :titulo
  belongs_to :universidad
  belongs_to :ciudad
  belongs_to :docente

  validates_presence_of :area_conocimiento

end
