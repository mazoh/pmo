class Experiencia < ActiveRecord::Base
  belongs_to :docente

  validates_presence_of :docencia
  validates_presence_of :institucion_empresa
  validates_presence_of :area
  validates_presence_of :periodo
  validates_presence_of :ano

end
