require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PayPeriodsController do

  # This should return the minimal set of attributes required to create a valid
  # PayPeriod. As you add validations to PayPeriod, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:pay_period) }

  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET index" do
    it "assigns all pay_periods as @pay_periods" do
      pay_period = create(:pay_period, user: user)
      get :index, {}
      assigns(:pay_periods).should eq([pay_period])
    end
  end

  describe "GET show" do
    it "assigns the requested pay_period as @pay_period" do
      pay_period = create(:pay_period, user: user)
      get :show, {:id => pay_period.to_param}
      assigns(:pay_period).should eq(pay_period)
    end
  end

  describe "GET current" do
    subject { get :current }

    describe "when a current pay_period exists" do
      let!(:pay_period) { create(:pay_period, end_date: Date.today + 1, user: user) }

      it "assigns the requested pay_period as @pay_period" do
        subject
        assigns(:pay_period).should eq(pay_period)
      end
    end

    describe "when no current pay_period exists" do
      let!(:pay_period) { create(:pay_period, user: user) }

      it "assigns @pay_period to nil" do
        subject
        assigns(:pay_period).should be_nil
      end

      it "renders the 'missing' template" do
        subject
        response.should render_template(:missing)
      end
    end
  end

  describe "GET new" do
    it "assigns a new pay_period as @pay_period" do
      get :new, {}
      assigns(:pay_period).should be_a_new(PayPeriod)
    end
  end

  describe "GET edit" do
    it "assigns the requested pay_period as @pay_period" do
      pay_period = create(:pay_period, user: user)
      get :edit, {:id => pay_period.to_param}
      assigns(:pay_period).should eq(pay_period)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PayPeriod" do
        expect {
          post :create, {:pay_period => valid_attributes.merge({user_id: user.id})}
        }.to change(PayPeriod, :count).by(1)
      end

      it "assigns a newly created pay_period as @pay_period" do
        post :create, {:pay_period => valid_attributes.merge({user_id: user.id})}
        assigns(:pay_period).should be_a(PayPeriod)
        assigns(:pay_period).should be_persisted
      end

      it "redirects to the created pay_period" do
        post :create, {:pay_period => valid_attributes.merge({user_id: user.id})}
        response.should redirect_to(PayPeriod.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pay_period as @pay_period" do
        # Trigger the behavior that occurs when invalid params are submitted
        PayPeriod.any_instance.stub(:save).and_return(false)
        post :create, {:pay_period => { "gross_income" => "invalid value" }}
        assigns(:pay_period).should be_a_new(PayPeriod)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PayPeriod.any_instance.stub(:save).and_return(false)
        post :create, {:pay_period => { "gross_income" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pay_period" do
        pay_period = create(:pay_period, user: user)
        # Assuming there are no other pay_periods in the database, this
        # specifies that the PayPeriod created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PayPeriod.any_instance.should_receive(:update_attributes).with({ "gross_income" => "1.5" })
        put :update, {:id => pay_period.to_param, :pay_period => { "gross_income" => "1.5" }}
      end

      it "assigns the requested pay_period as @pay_period" do
        pay_period = create(:pay_period, user: user)
        put :update, {:id => pay_period.to_param, :pay_period => valid_attributes}
        assigns(:pay_period).should eq(pay_period)
      end

      it "redirects to the pay_period" do
        pay_period = create(:pay_period, user: user)
        put :update, {:id => pay_period.to_param, :pay_period => valid_attributes}
        response.should redirect_to(pay_period)
      end
    end

    describe "with invalid params" do
      it "assigns the pay_period as @pay_period" do
        pay_period = create(:pay_period, user: user)
        # Trigger the behavior that occurs when invalid params are submitted
        PayPeriod.any_instance.stub(:save).and_return(false)
        put :update, {:id => pay_period.to_param, :pay_period => { "gross_income" => "invalid value" }}
        assigns(:pay_period).should eq(pay_period)
      end

      it "re-renders the 'edit' template" do
        pay_period = create(:pay_period, user: user)
        # Trigger the behavior that occurs when invalid params are submitted
        PayPeriod.any_instance.stub(:save).and_return(false)
        put :update, {:id => pay_period.to_param, :pay_period => { "gross_income" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pay_period" do
      pay_period = create(:pay_period, user: user)
      expect {
        delete :destroy, {:id => pay_period.to_param}
      }.to change(PayPeriod, :count).by(-1)
    end

    it "redirects to the pay_periods list" do
      pay_period = create(:pay_period, user: user)
      delete :destroy, {:id => pay_period.to_param}
      response.should redirect_to(pay_periods_url)
    end
  end

end
