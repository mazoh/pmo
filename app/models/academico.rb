class Academico < ActiveRecord::Base
  belongs_to :practica
  belongs_to :ciudad

  validates_presence_of :titulo
  validates_presence_of :centro

end
