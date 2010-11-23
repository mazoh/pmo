class HerramientasController < ApplicationController

  before_filter :practica_and_herramientas
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@herramientas = Herramienta.all
    @herramientas = @practica.herramientas.find(:all)
    #@herramientas = @practica.herramientas.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @herramientas }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @herramienta }
    end
  end

  def new
    @herramienta = Herramienta.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @herramienta }
    end
  end

  def edit
  end

  def create
    @herramienta = Herramienta.new(params[:herramienta])
    @herramienta.practica_id = @practica.id
    respond_to do |format|
      if @herramienta.save
        flash[:notice] = 'Herramienta creada satisfactoriamente'
        format.html { redirect_to practica_herramientas_path(@practica) }
        format.xml  { render :xml => @herramienta, :status => :created, :location => @herramienta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @herramienta.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @herramienta.update_attributes(params[:herramienta])
        flash[:notice] = 'Herramienta actualizada satisfactoriamente'
        format.html { redirect_to practica_herramientas_path(@practica) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @herramienta.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @herramienta.destroy
    respond_to do |format|
      format.html { redirect_to practica_herramientas_path(@practica) }
      format.xml  { head :ok }
    end
  end

  protected
   def practica_and_herramientas
    @practica = Practica.find(params[:practica_id])
    @herramienta = Herramienta.find(params[:id]) if params[:id]
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
