class Docente < ActiveRecord::Base

  has_many :lineas
  has_many :formaciones
  has_many :experiencias
  has_many :publicaciones
  has_many :dominios
  has_many :prototipos
  has_many :investigaciones
  belongs_to :nacionalidad
  belongs_to :area
  belongs_to :centro
  belongs_to :cargo

  #has_attached_file :foto,
  #                  :styles => { :medium => "300x300>",
  #                               :thumb => "100x100>",
  #                               :small => "110x150#" },
  #                               :default_url => "rails.png"

  validates_presence_of :fecha_diligencia
  validates_presence_of :nombres
  validates_presence_of :apellidos
  validates_presence_of :genero
  validates_presence_of :fecha_nacimiento
  validates_presence_of :nacionalidad_id
  validates_presence_of :tipo_documento
  validates_presence_of :num_documento
  validates_presence_of :email
  validates_presence_of :telefono_fijo
  validates_presence_of :centro_id
  validates_presence_of :area_id
  validates_presence_of :cargo_id
  validates_presence_of :antiguedad
  validates_presence_of :dedicacion    
  validates_numericality_of :num_documento, :on => :create
  validates_numericality_of :telefono_fijo, :on => :create
  validates_numericality_of :fax, :on => :create
  validates_format_of :email, :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates_length_of :telefono_fijo, :minimum=>7, :message=>"minimo 7 caracteres"

  def generos
     (self.genero == 1) ? "Masculino" : "Femenino"
  end

  def hojas
     (self.hoja_registrada == 1) ? "Si" : "No"
  end

  def apoyos
     (self.requiere_apoyo == 1) ? "Si" : "No"
  end

  def grupos
     (self.adscrito_grupo == 1) ? "Si" : "No"
  end

  def comunidades
     (self.adscrito_comunidad == 1) ? "Si" : "No"
  end

  def sitios
     (self.sitio == 1) ? "Si" : "No"
  end

  def self.search(search)
      if search
        find(:all, :conditions => ['num_documento LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
  end

end
