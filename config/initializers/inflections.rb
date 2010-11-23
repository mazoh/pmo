ActiveSupport::Inflector.inflections do |inflect|
   inflect.plural /([aeiou])([A-Z]|_|$)/, '\1s\2'
   inflect.plural /([rlnd])([A-Z]|_|$)/, '\1es\2'
   inflect.singular /([aeiou])s([A-Z]|_|$)/, '\1\2'
   inflect.singular /([rlnd])es([A-Z]|_|$)/, '\1\2'
   inflect.irregular 'aprendiz', 'aprendices'
   inflect.irregular 'ciudad', 'ciudades'
   inflect.irregular 'especial', 'especiales'
   inflect.irregular 'formacion', 'formaciones'
   inflect.irregular 'investigacion', 'investigaciones'
   inflect.irregular 'nacionalidad', 'nacionalidades'
   inflect.irregular 'pais', 'paises'
   inflect.irregular 'publicacion', 'publicaciones'
   inflect.irregular 'universidad', 'universidades'
   inflect.irregular 'session', 'sessions'
   inflect.irregular 'user', 'users'
end

