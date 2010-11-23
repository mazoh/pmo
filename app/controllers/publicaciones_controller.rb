class PublicacionesController < ApplicationController

  before_filter :docente_and_publicaciones
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    @publicaciones = @docente.publicaciones.find(:all)
    #@publicaciones = @docente.publicaciones.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @publicaciones }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @publicacion }
    end
  end

  def new
    @publicacion = Publicacion.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @publicacion }
    end
  end

  def edit
  end

  def create
    @publicacion = Publicacion.new(params[:publicacion])
    @publicacion.docente_id = @docente.id
    respond_to do |format|
      if @publicacion.save
        flash[:notice] = 'Publicacion creada satisfactoriamente'
        format.html { redirect_to docente_publicaciones_path(@docente) }
        format.xml  { render :xml => @publicacion, :status => :created, :location => @publicacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publicacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @publicacion.update_attributes(params[:publicacion])
        flash[:notice] = 'Publicacion actualizada satisfactoriamente'
        format.html { redirect_to docente_publicaciones_path(@docente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @publicacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @publicacion.destroy
    respond_to do |format|
      format.html { redirect_to docente_publicaciones_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_publicaciones
    @docente = Docente.find(params[:docente_id])
    @publicacion = Publicacion.find(params[:id]) if params[:id]
   end

  private
  def determine_layout
     if ['index'].include?(action_name)
        "application"
     else
        "basico"
     end
  end
end
