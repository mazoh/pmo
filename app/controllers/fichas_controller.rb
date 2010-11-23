class FichasController < ApplicationController

  before_filter :programa_and_fichas
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@fichas = Ficha.all
   #@fichas = @programa.fichas.find(:all)
    @fichas =  @programa.fichas.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @fichas }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @ficha }
    end
  end

  def new
    @ficha = Ficha.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @ficha }
    end
  end

  def edit
  end

  def create
    @ficha = Ficha.new(params[:ficha])
    @ficha.programa_id = @programa.id
    respond_to do |format|
      if @ficha.save
       flash[:notice] = 'Ficha creada satisfactoriamente'
        format.html { redirect_to programa_fichas_path(@programa) }
        format.xml  { render :xml => @ficha, :status => :created, :location => @ficha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @ficha.update_attributes(params[:ficha])
       flash[:notice] = 'Ficha actualizada satisfactoriamente'
        format.html { redirect_to programa_fichas_path(@programa) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ficha.destroy
    respond_to do |format|
      format.html { redirect_to programa_fichas_path(@programa) }
      format.xml  { head :ok }
    end
  end

   protected
   def programa_and_fichas
    @programa = Programa.find(params[:programa_id])
    @ficha = Ficha.find(params[:id]) if params[:id]
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
