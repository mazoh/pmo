class Alternativa < ActiveRecord::Base
  belongs_to :practica

  validates_presence_of :tema

end
