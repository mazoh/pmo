class CentrosController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@centros = Centro.all
    @centros = Centro.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @centros }
    end
  end

  def show
    @centro = Centro.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @centro }
    end
  end

  def new
    @centro = Centro.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @centro }
    end
  end

  def edit
    @centro = Centro.find(params[:id])
  end

  def create
    @centro = Centro.new(params[:centro])

    respond_to do |format|
      if @centro.save
        format.html { redirect_to(@centro, :notice => 'Centro creado satisfactoriamente') }
        format.xml  { render :xml => @centro, :status => :created, :location => @centro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @centro.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @centro = Centro.find(params[:id])
    respond_to do |format|
      if @centro.update_attributes(params[:centro])
        format.html { redirect_to(@centro, :notice => 'Centro actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @centro.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @centro = Centro.find(params[:id])
    @centro.destroy
    respond_to do |format|
      format.html { redirect_to(centros_url) }
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