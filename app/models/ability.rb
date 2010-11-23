class Ability

   include CanCan::Ability

   def initialize(user)
      user ||= User.new # Guest user
      if user.role? :admin
          can :manage, :all

      elsif user.role? :funcionario
          can :manage, :all

      elsif user.role? :instructor
          can :read, Inicio
          can :read, Docente
          can :create, Docente
          can :update, Docente
          can :read, Formacion
          can :create, Formacion
          can :update, Formacion
          can :read, Experiencia
          can :create, Experiencia
          can :update, Experiencia
          can :read, Publicacion
          can :create, Publicacion
          can :update, Publicacion
          can :read, Dominio
          can :create, Dominio
          can :update, Dominio
          can :read, Prototipo
          can :create, Prototipo
          can :update, Prototipo
          can :read, Investigacion
          can :create, Investigacion
          can :update, Investigacion
          can :read, Linea
          can :create, Linea
          can :update, Linea

          can :read, Programa
          can :read, Ficha
          can :read, Aprendiz
          can :read, Practica
          can :read, Academico
          can :read, Alternativa
          can :read, Fortaleza
          can :read, Herramienta

          can :read, Especial

      elsif user.role? :aprendiz
          can :read, Inicio
          can :read, Programa
          can :read, Ficha          
          can :read, Aprendiz
          can :create, Aprendiz
          can :update, Aprendiz
          can :read, Practica
          can :create, Practica
          can :update, Practica
          can :read, Academico
          can :create, Academico
          can :update, Academico
          can :read, Alternativa
          can :create, Alternativa
          can :update, Alternativa
          can :read, Fortaleza
          can :create, Fortaleza
          can :update, Fortaleza
          can :read, Herramienta
          can :create, Herramienta
          can :update, Herramienta

          can :read, Especial

      else
          can :read, Inicio
      end
  end
end
