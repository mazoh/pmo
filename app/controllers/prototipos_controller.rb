class PrototiposController < ApplicationController

  before_filter :docente_and_prototipos
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    @prototipos = @docente.prototipos.find(:all)
    #@prototipos = @docente.prototipos.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @prototipos }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @prototipo }
    end
  end

  def new
    @prototipo = Prototipo.new
    @paises = Pais.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @prototipo }
    end
  end

  def edit
    @paises = Pais.all
  end

  def create
    @prototipo = Prototipo.new(params[:prototipo])
    @prototipo.docente_id = @docente.id
    respond_to do |format|
      if @prototipo.save
        flash[:notice] = 'Prototipo creado satisfactoriamente'
        format.html { redirect_to docente_prototipos_path(@docente) }
        format.xml  { render :xml => @prototipo, :status => :created, :location => @prototipo }
      else
        @paises = Pais.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @prototipo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prototipo.update_attributes(params[:prototipo])
        flash[:notice] = 'Prototipo actualizado satisfactoriamente'
        format.html { redirect_to docente_prototipos_path(@docente) }
        format.xml  { head :ok }
      else
        @paises = Pais.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prototipo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @prototipo.destroy
    respond_to do |format|
      format.html { redirect_to docente_prototipos_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_prototipos
    @docente = Docente.find(params[:docente_id])
    @prototipo = Prototipo.find(params[:id]) if params[:id]
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
