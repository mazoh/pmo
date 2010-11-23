class Investigacion < ActiveRecord::Base
  belongs_to :universidad
  belongs_to :ciudad
  belongs_to :docente

  validates_presence_of :tema
  validates_presence_of :tipo_formacion
  validates_presence_of :ano

end
