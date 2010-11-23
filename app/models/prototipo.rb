class Prototipo < ActiveRecord::Base
  belongs_to :docente

  validates_presence_of :depositario
  validates_presence_of :titulo_invencion
  validates_presence_of :tipo_patente
  validates_presence_of :num_registro
  validates_presence_of :ano

end
