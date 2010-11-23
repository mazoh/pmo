# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101123042820) do

  create_table "academicos", :force => true do |t|
    t.string   "titulo"
    t.string   "centro"
    t.integer  "ciudad_id"
    t.string   "estado"
    t.integer  "practica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alternativas", :force => true do |t|
    t.string   "tema"
    t.string   "desicion"
    t.string   "cual"
    t.integer  "practica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aprendices", :force => true do |t|
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.string   "nivel"
    t.string   "etapa"
    t.string   "tipo_doc"
    t.string   "num_doc"
    t.string   "nombre"
    t.string   "apellido_uno"
    t.string   "apellido_dos"
    t.boolean  "genero"
    t.string   "email"
    t.string   "telefono"
    t.string   "celular"
    t.string   "estado"
    t.integer  "especial_id"
    t.string   "tipo_respuesta"
    t.integer  "ficha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "centro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centros", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ciudades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "docentes", :force => true do |t|
    t.date     "fecha_diligencia"
    t.string   "nombres"
    t.string   "apellidos"
    t.boolean  "genero"
    t.date     "fecha_nacimiento"
    t.integer  "nacionalidad_id"
    t.string   "tipo_documento"
    t.string   "num_documento"
    t.string   "email"
    t.integer  "telefono_fijo"
    t.integer  "fax"
    t.string   "telefono_movil"
    t.integer  "area_id"
    t.integer  "cargo_id"
    t.string   "antiguedad"
    t.string   "dedicacion"
    t.string   "nombre_entidad"
    t.string   "tipo_vinculacion"
    t.boolean  "hoja_registrada"
    t.boolean  "requiere_apoyo"
    t.boolean  "adscrito_grupo"
    t.string   "nombre_grupo"
    t.boolean  "adscrito_comunidad"
    t.string   "nombre_comunidad"
    t.boolean  "sitio"
    t.string   "nombre_sitio"
    t.string   "sugerencias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dominios", :force => true do |t|
    t.integer  "idioma_id"
    t.string   "lee"
    t.string   "escribe"
    t.string   "habla"
    t.string   "traduce"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especiales", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiencias", :force => true do |t|
    t.string   "docencia"
    t.string   "institucion_empresa"
    t.string   "area"
    t.string   "periodo"
    t.date     "ano"
    t.string   "resultados"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fichas", :force => true do |t|
    t.string   "numero"
    t.integer  "programa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formaciones", :force => true do |t|
    t.string   "tipo_estudio"
    t.integer  "titulo_id"
    t.string   "area_conocimiento"
    t.integer  "universidad_id"
    t.integer  "ciudad_id"
    t.string   "estado"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fortalezas", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "practica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "herramientas", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "practica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idiomas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investigaciones", :force => true do |t|
    t.string   "tema"
    t.string   "tipo_formacion"
    t.integer  "universidad_id"
    t.integer  "ciudad_id"
    t.date     "ano"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineas", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nacionalidades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practicas", :force => true do |t|
    t.date     "fecha_dil"
    t.boolean  "grupo"
    t.string   "nom_grup"
    t.boolean  "comunidad"
    t.string   "nom_com"
    t.boolean  "sitio"
    t.string   "nom_sit"
    t.boolean  "realiza_pract"
    t.string   "donde_pract"
    t.boolean  "partcipar"
    t.string   "area_part"
    t.integer  "aprendiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prototipos", :force => true do |t|
    t.string   "depositario"
    t.string   "titulo_invencion"
    t.string   "tipo_patente"
    t.integer  "pais_id"
    t.string   "num_registro"
    t.date     "ano"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicaciones", :force => true do |t|
    t.string   "autor"
    t.string   "titulo_publicacion"
    t.string   "tipo_publicacion"
    t.date     "ano"
    t.string   "referencia"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titulos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universidades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                         :null => false
    t.string   "email"
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
  end

end
