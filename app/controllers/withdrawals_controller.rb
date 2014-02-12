class WithdrawalsController < ApplicationController
  # GET /withdrawals
  # GET /withdrawals.json
  def index
    @withdrawals = current_user.pay_periods.last.withdrawals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @withdrawals }
    end
  end

  # GET /withdrawals/1
  # GET /withdrawals/1.json
  def show
    @withdrawal = Withdrawal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @withdrawal }
    end
  end

  # GET /withdrawals/new
  # GET /withdrawals/new.json
  def new
    @withdrawal = Withdrawal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @withdrawal }
    end
  end

  # GET /withdrawals/1/edit
  def edit
    @withdrawal = Withdrawal.find(params[:id])
  end

  # POST /withdrawals
  # POST /withdrawals.json
  def create
    @withdrawal = Withdrawal.new(params[:withdrawal])

    respond_to do |format|
      if @withdrawal.save
        format.html { redirect_to @withdrawal.pay_period, notice: 'Withdrawal was successfully created.' }
        format.json { render json: @withdrawal.pay_period, status: :created, location: @withdrawal.pay_period }
      else
        format.html { render action: "new" }
        format.json { render json: @withdrawal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /withdrawals/1
  # PUT /withdrawals/1.json
  def update
    @withdrawal = Withdrawal.find(params[:id])

    respond_to do |format|
      if @withdrawal.update_attributes(params[:withdrawal])
        format.html { redirect_to @withdrawal, notice: 'Withdrawal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @withdrawal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdrawals/1
  # DELETE /withdrawals/1.json
  def destroy
    @withdrawal = Withdrawal.find(params[:id])
    @withdrawal.destroy

    respond_to do |format|
      format.html { redirect_to withdrawals_url }
      format.json { head :no_content }
    end
  end
end
