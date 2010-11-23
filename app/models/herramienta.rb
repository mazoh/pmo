class Herramienta < ActiveRecord::Base
  belongs_to :practica

  validates_presence_of :nombre

end
