class PayPeriodsController < ApplicationController
  # GET /pay_periods
  # GET /pay_periods.json
  def index
    @pay_periods = current_user.pay_periods

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pay_periods }
    end
  end

  # GET /pay_periods/1
  # GET /pay_periods/1.json
  def show
    @pay_period = PayPeriod.find(params[:id])
    @withdrawal = Withdrawal.new(pay_period_id: @pay_period.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pay_period }
    end
  end

  # GET /pay_periods/current
  # GET /pay_periods/current.json
  def current
    @pay_period = current_user.current_pay_period
    if @pay_period
      @withdrawal = Withdrawal.new(pay_period_id: @pay_period.id)

      respond_to do |format|
        format.html { render :show }
        format.json { render json: @pay_period }
      end
    else
      respond_to do |format|
        format.html { render :missing }
        format.json { render text: "Missing pay period" }
      end
    end
  end

  # GET /pay_periods/new
  # GET /pay_periods/new.json
  def new
    @pay_period = PayPeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pay_period }
    end
  end

  # GET /pay_periods/1/edit
  def edit
    @pay_period = PayPeriod.find(params[:id])
  end

  # POST /pay_periods
  # POST /pay_periods.json
  def create
    @pay_period = PayPeriod.new(params[:pay_period])

    respond_to do |format|
      if @pay_period.save
        format.html { redirect_to @pay_period, notice: 'Pay period was successfully created.' }
        format.json { render json: @pay_period, status: :created, location: @pay_period }
      else
        format.html { render action: "new" }
        format.json { render json: @pay_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pay_periods/1
  # PUT /pay_periods/1.json
  def update
    @pay_period = PayPeriod.find(params[:id])

    respond_to do |format|
      if @pay_period.update_attributes(params[:pay_period])
        format.html { redirect_to @pay_period, notice: 'Pay period was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pay_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_periods/1
  # DELETE /pay_periods/1.json
  def destroy
    @pay_period = PayPeriod.find(params[:id])
    @pay_period.destroy

    respond_to do |format|
      format.html { redirect_to pay_periods_url }
      format.json { head :no_content }
    end
  end
end
