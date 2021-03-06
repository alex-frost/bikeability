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

describe EmailTemplatesController do
  before do
    sign_in
  end

  # This should return the minimal set of attributes required to create a valid
  # EmailTemplate. As you add validations to EmailTemplate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "template_name" => "MyString" , "body" => "MyBody"} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailTemplatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all email_templates as @email_templates" do
      email_template = EmailTemplate.create! valid_attributes
      get :index, {}, valid_session
      assigns(:email_templates).should eq([email_template])
    end
  end

  describe "GET show" do
    it "assigns the requested email_template as @email_template" do
      email_template = EmailTemplate.create! valid_attributes
      get :show, {:id => email_template.to_param}, valid_session
      assigns(:email_template).should eq(email_template)
    end
  end


  describe "GET edit" do
    it "assigns the requested email_template as @email_template" do
      email_template = EmailTemplate.create! valid_attributes
      get :edit, {:id => email_template.to_param}, valid_session
      assigns(:email_template).should eq(email_template)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested email_template" do
        email_template = EmailTemplate.create! valid_attributes
        # Assuming there are no other email_templates in the database, this
        # specifies that the EmailTemplate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EmailTemplate.any_instance.should_receive(:update).with({ "body" => "MyString" })
        put :update, {:id => email_template.to_param, :email_template => { "body" => "MyString" }}, valid_session
      end

      it "assigns the requested email_template as @email_template" do
        email_template = EmailTemplate.create! valid_attributes
        put :update, {:id => email_template.to_param, :email_template => valid_attributes}, valid_session
        assigns(:email_template).should eq(email_template)
      end

    end

    describe "with invalid params" do
      it "assigns the email_template as @email_template" do
        email_template = EmailTemplate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailTemplate.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_template.to_param, :email_template => { "body" => "invalid value" }}, valid_session
        assigns(:email_template).should eq(email_template)
      end

      it "re-renders the 'edit' template" do
        email_template = EmailTemplate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailTemplate.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_template.to_param, :email_template => { "body" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

end
