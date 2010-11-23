class Publicacion < ActiveRecord::Base
  belongs_to :docente

  validates_presence_of :autor
  validates_presence_of :titulo_publicacion
  validates_presence_of :tipo_publicacion
  validates_presence_of :ano

end
