class Aprendiz < ActiveRecord::Base
  has_many :practicas
  belongs_to :ficha
  belongs_to :especial

  #has_attached_file :foto,
  #                 :styles => { :medium => "300x300>",
  #                              :thumb => "100x100>",
  #                              :small => "110x150#" },
  #                              :default_url => "user.png"

  validates_presence_of :fecha_inicio
  validates_presence_of :fecha_fin
  validates_presence_of :nivel
  validates_presence_of :etapa
  validates_presence_of :tipo_doc
  validates_presence_of :num_doc
  validates_presence_of :nombre
  validates_presence_of :apellido_uno
  validates_presence_of :genero
  validates_presence_of :email
  validates_presence_of :telefono
  validates_presence_of :estado
  validates_presence_of :especial_id
  validates_presence_of :tipo_respuesta
  validates_numericality_of :num_doc, :on => :create
  validates_numericality_of :telefono, :on => :create
  validates_format_of :email, :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates_length_of :telefono_fijo, :minimum=>7, :message=>"minimo 7 caracteres"

  def generos
     (self.genero == 1) ? "Masculino" : "Femenino"
  end

  def self.search(search)
      if search
        find(:all, :conditions => ['num_doc LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
  end

end
