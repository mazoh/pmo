class ExperienciasController < ApplicationController

  before_filter :docente_and_experiencias
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    @experiencias = @docente.experiencias.find(:all)
    #@experiencias = @docente.experiencias.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @experiencias }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @experiencia }
    end
  end

  def new
    @experiencia = Experiencia.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @experiencia }
    end
  end

  def edit
  end

  def create
    @experiencia = Experiencia.new(params[:experiencia])
    @experiencia.docente_id = @docente.id
    respond_to do |format|
      if @experiencia.save
        flash[:notice] = 'Experiencia creada satisfactoriamente'
        format.html { redirect_to docente_experiencias_path(@docente) }
        format.xml  { render :xml => @experiencia, :status => :created, :location => @experiencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @experiencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @experiencia.update_attributes(params[:experiencia])
        flash[:notice] = 'Experiencia actualizada satisfactoriamente'
        format.html { redirect_to docente_experiencias_path(@docente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @experiencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @experiencia.destroy
    respond_to do |format|
      format.html { redirect_to docente_experiencias_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_experiencias
    @docente = Docente.find(params[:docente_id])
    @experiencia = Experiencia.find(params[:id]) if params[:id]
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