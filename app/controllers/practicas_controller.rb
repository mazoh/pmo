class PracticasController < ApplicationController

  before_filter :aprendiz_and_practicas
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@practicas = Practica.all
    @practicas = @aprendiz.practicas.find(:all)
    #@practicas = @aprendiz.practicas.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @practicas }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @practica }
    end
  end

  def new
    @practica = Practica.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @practica }
    end
  end

  def edit
  end

  def create
    @practica = Practica.new(params[:practica])
    @practica.aprendiz_id = @aprendiz.id
    respond_to do |format|
      if @practica.save
        flash[:notice] = 'Practica creada satisfactoriamente'
        format.html { redirect_to aprendiz_practicas_path(@aprendiz) }
        format.xml  { render :xml => @practica, :status => :created, :location => @practica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @practica.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @practica.update_attributes(params[:practica])
        flash[:notice] = 'Practica actualizada satisfactoriamente'
        format.html { redirect_to aprendiz_practicas_path(@aprendiz) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @practica.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @practica.destroy
    respond_to do |format|
      format.html { redirect_to aprendiz_practicas_path(@aprendiz) }
      format.xml  { head :ok }
    end
  end

  protected
   def aprendiz_and_practicas
    @aprendiz = Aprendiz.find(params[:aprendiz_id])
    @practica = Practica.find(params[:id]) if params[:id]
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
