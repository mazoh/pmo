class LineasController < ApplicationController

  before_filter :docente_and_lineas
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    @lineas = @docente.lineas.find(:all)
    #@lineas  = @docente.lineas.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @lineas }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @linea }
    end
  end

  def new
    @linea = Linea.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @linea }
    end
  end

  def edit
  end

  def create
    @linea = Linea.new(params[:linea])
    @linea.docente_id = @docente.id
    respond_to do |format|
      if @linea.save
        flash[:notice] = 'Proyecto creado satisfactoriamente'
        format.html { redirect_to docente_lineas_path(@docente) }
        format.xml  { render :xml => @linea, :status => :created, :location => @linea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @linea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @linea.update_attributes(params[:linea])
        flash[:notice] = 'Proyecto actualizado satisfactoriamente'
        format.html { redirect_to docente_lineas_path(@docente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @linea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @linea.destroy
    respond_to do |format|
      format.html { redirect_to docente_lineas_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_lineas
    @docente = Docente.find(params[:docente_id])
    @linea = Linea.find(params[:id]) if params[:id]
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
