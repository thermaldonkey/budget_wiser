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

describe DeductionsController do

  # This should return the minimal set of attributes required to create a valid
  # Deduction. As you add validations to Deduction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:deduction) }

  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET index" do
    it "assigns all deductions as @deductions" do
      deduction = create(:deduction, user: user)
      get :index, {}
      assigns(:deductions).should eq([deduction])
    end
  end

  describe "GET show" do
    it "assigns the requested deduction as @deduction" do
      deduction = Deduction.create! valid_attributes
      get :show, {:id => deduction.to_param}
      assigns(:deduction).should eq(deduction)
    end
  end

  describe "GET new" do
    it "assigns a new deduction as @deduction" do
      get :new, {}
      assigns(:deduction).should be_a_new(Deduction)
    end
  end

  describe "GET edit" do
    it "assigns the requested deduction as @deduction" do
      deduction = Deduction.create! valid_attributes
      get :edit, {:id => deduction.to_param}
      assigns(:deduction).should eq(deduction)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Deduction" do
        expect {
          post :create, {:deduction => valid_attributes}
        }.to change(Deduction, :count).by(1)
      end

      it "assigns a newly created deduction as @deduction" do
        post :create, {:deduction => valid_attributes}
        assigns(:deduction).should be_a(Deduction)
        assigns(:deduction).should be_persisted
      end

      it "redirects to the created deduction" do
        post :create, {:deduction => valid_attributes}
        response.should redirect_to(Deduction.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deduction as @deduction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deduction.any_instance.stub(:save).and_return(false)
        post :create, {:deduction => { "value" => "invalid value" }}
        assigns(:deduction).should be_a_new(Deduction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deduction.any_instance.stub(:save).and_return(false)
        post :create, {:deduction => { "value" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested deduction" do
        deduction = Deduction.create! valid_attributes
        # Assuming there are no other deductions in the database, this
        # specifies that the Deduction created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Deduction.any_instance.should_receive(:update_attributes).with({ "value" => "1.5" })
        put :update, {:id => deduction.to_param, :deduction => { "value" => "1.5" }}
      end

      it "assigns the requested deduction as @deduction" do
        deduction = Deduction.create! valid_attributes
        put :update, {:id => deduction.to_param, :deduction => valid_attributes}
        assigns(:deduction).should eq(deduction)
      end

      it "redirects to the deduction" do
        deduction = Deduction.create! valid_attributes
        put :update, {:id => deduction.to_param, :deduction => valid_attributes}
        response.should redirect_to(deduction)
      end
    end

    describe "with invalid params" do
      it "assigns the deduction as @deduction" do
        deduction = Deduction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deduction.any_instance.stub(:save).and_return(false)
        put :update, {:id => deduction.to_param, :deduction => { "value" => "invalid value" }}
        assigns(:deduction).should eq(deduction)
      end

      it "re-renders the 'edit' template" do
        deduction = Deduction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deduction.any_instance.stub(:save).and_return(false)
        put :update, {:id => deduction.to_param, :deduction => { "value" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested deduction" do
      deduction = Deduction.create! valid_attributes
      expect {
        delete :destroy, {:id => deduction.to_param}
      }.to change(Deduction, :count).by(-1)
    end

    it "redirects to the deductions list" do
      deduction = Deduction.create! valid_attributes
      delete :destroy, {:id => deduction.to_param}
      response.should redirect_to(deductions_url)
    end
  end

end