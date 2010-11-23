class Dominio < ActiveRecord::Base
  belongs_to :idioma
  belongs_to :docente
end
