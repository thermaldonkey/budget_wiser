class DeductionsController < ApplicationController
  # GET /deductions
  # GET /deductions.json
  def index
    @deductions = Deduction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deductions }
    end
  end

  # GET /deductions/1
  # GET /deductions/1.json
  def show
    @deduction = Deduction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deduction }
    end
  end

  # GET /deductions/new
  # GET /deductions/new.json
  def new
    @deduction = Deduction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deduction }
    end
  end

  # GET /deductions/1/edit
  def edit
    @deduction = Deduction.find(params[:id])
  end

  # POST /deductions
  # POST /deductions.json
  def create
    @deduction = Deduction.new(params[:deduction])

    respond_to do |format|
      if @deduction.save
        format.html { redirect_to @deduction, notice: 'Deduction was successfully created.' }
        format.json { render json: @deduction, status: :created, location: @deduction }
      else
        format.html { render action: "new" }
        format.json { render json: @deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deductions/1
  # PUT /deductions/1.json
  def update
    @deduction = Deduction.find(params[:id])

    respond_to do |format|
      if @deduction.update_attributes(params[:deduction])
        format.html { redirect_to @deduction, notice: 'Deduction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deductions/1
  # DELETE /deductions/1.json
  def destroy
    @deduction = Deduction.find(params[:id])
    @deduction.destroy

    respond_to do |format|
      format.html { redirect_to deductions_url }
      format.json { head :no_content }
    end
  end
end
