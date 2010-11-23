class Linea < ActiveRecord::Base
  belongs_to :docente

  validates_presence_of :nombre
end
