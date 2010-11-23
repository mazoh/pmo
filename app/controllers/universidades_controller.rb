class UniversidadesController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@universidades = Universidad.all
    @universidades = Universidad.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @universidades }
    end
  end

  def show
    @universidad = Universidad.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @universidad }
    end
  end

  def new
    @universidad = Universidad.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @universidad }
    end
  end

  def edit
    @universidad = Universidad.find(params[:id])
  end

  def create
    @universidad = Universidad.new(params[:universidad])
    respond_to do |format|
      if @universidad.save
        format.html { redirect_to(@universidad, :notice => 'Universidad creada satisfactoriamente') }
        format.xml  { render :xml => @universidad, :status => :created, :location => @universidad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @universidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @universidad = Universidad.find(params[:id])
    respond_to do |format|
      if @universidad.update_attributes(params[:universidad])
        format.html { redirect_to(@universidad, :notice => 'Universidad actualizada satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @universidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @universidad = Universidad.find(params[:id])
    @universidad.destroy
    respond_to do |format|
      format.html { redirect_to(universidades_url) }
      format.xml  { head :ok }
    end
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
