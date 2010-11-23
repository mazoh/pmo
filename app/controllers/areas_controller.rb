class AreasController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@areas = Area.all
    @areas = Area.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @areas }
    end
  end

  def show
    @area = Area.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @area }
    end
  end

  def new
    @area = Area.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @area }
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to(@area, :notice => 'Area creada satisfactoriamente') }
        format.xml  { render :xml => @area, :status => :created, :location => @area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to(@area, :notice => 'Area actualizada satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    respond_to do |format|
      format.html { redirect_to(areas_url) }
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