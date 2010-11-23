class AlternativasController < ApplicationController

  before_filter :practica_and_alternativas
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@alternativas = Alternativa.all
    @alternativas = @practica.alternativas.find(:all)
    #@alternativas = @practica.alternativas.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @alternativas }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @alternativa }
    end
  end

  def new
    @alternativa = Alternativa.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @alternativa }
    end
  end

  def edit
  end

  def create
    @alternativa = Alternativa.new(params[:alternativa])
    @alternativa.practica_id = @practica.id
    respond_to do |format|
      if @alternativa.save
        flash[:notice] = 'Alternativa creada satisfactoriamente'
        format.html { redirect_to practica_alternativas_path(@practica) }
        format.xml  { render :xml => @alternativa, :status => :created, :location => @alternativa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alternativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @alternativa.update_attributes(params[:alternativa])
        flash[:notice] = 'Alternativa actualizada satisfactoriamente'
        format.html { redirect_to practica_alternativas_path(@practica) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alternativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @alternativa.destroy
    respond_to do |format|
      format.html { redirect_to practica_alternativas_path(@practica) }
      format.xml  { head :ok }
    end
  end

  protected
   def practica_and_alternativas
    @practica = Practica.find(params[:practica_id])
    @alternativa = Alternativa.find(params[:id]) if params[:id]
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
