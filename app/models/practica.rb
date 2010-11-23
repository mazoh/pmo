class Practica < ActiveRecord::Base
  has_many :academicos
  has_many :alternativas
  has_many :fortalezas
  has_many :herramientas
  belongs_to :aprendiz

  validates_presence_of :fecha_dil
  validates_presence_of :grupo
  validates_presence_of :comunidad
  validates_presence_of :sitio
  validates_presence_of :realiza_pract
  validates_presence_of :participar

  def grupos
     (self.grupo == 1) ? "Si" : "No"
  end

  def comunidades
     (self.comunidad == 1) ? "Si" : "No"
  end

  def sitios
     (self.sitio == 1) ? "Si" : "No"
  end

  def practicas
     (self.realiza_pract == 1) ? "Si" : "No"
  end

  def participacion
     (self.participar == 1) ? "Si" : "No"
  end

end
