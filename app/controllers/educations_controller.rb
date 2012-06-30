class EducationsController < ApplicationController
  # GET /educations
  # GET /educations.json
  before_filter :authenticate_user!, :except => [:show]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  # GET /educations/1
  # GET /educations/1.json
  def show
    
    if params[:id].to_i != current_user.id.to_i
      params[:id]=current_user.id
      @education = Education.find(params[:id])
    else
      @education = Education.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @education }
    end
  end

  # GET /educations/new
  # GET /educations/new.json
  def new
    @education = Education.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @education }
    end
  end

  # GET /educations/1/edit
  # POST /educations
  # POST /educations.json
  def create
    @user = current_user
    @education = @user.build_education(params[:education])
    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.json { render json: @education, status: :created, location: @education }
      else
        format.html { render action: "new" }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /educations/1
  # PUT /educations/1.json


  # DELETE /educations/1
  # DELETE /educations/1.json
end
