require 'spec_helper'

describe OrganizationsController do
  let (:organization) { Fabricate(:organization) }
  let (:member) { Fabricate(:member, organization: organization)}

  describe "GET #index" do
    context "with a logged user" do
      it "populates and array of organizations" do
        login(member.user)

        get 'index'
        expect(assigns(:organizations)).to eq([organization])
      end
    end
  end

  describe "GET #new" do
    it "builds a new organization" do
      login(member.user)

      get :new
      expect(assigns(:organization)).to be_an_instance_of(Organization)
    end
  end

  describe "GET #show" do
    context "with valid params" do
      context "with a logged user" do
        pending "not implemented yet"
        # it "assigns the requested organization to @organization" do
        #   login(member.user)

        #   get 'show', id: offer.id
        #   expect(assigns(:offer)).to eq(offer)
        # end
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      context "with a logged user" do
        it "creates a new offer" do
          login(member.user)

          expect {
            post 'create', organization: Fabricate.to_params(:organization)
          }.to change(Organization,:count).by(1)
        end
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      context "with a logged user" do
        it "located the requested @organization" do
          login(member.user)

          put 'update', id: organization.id, organization: Fabricate.to_params(:organization)
          expect(assigns(:organization)).to eq(organization)
        end

        it "changes @organization's attributes" do
          login(member.user)

          put 'update', id: organization.id, organization: Fabricate.to_params(:organization, name: "New name")

          organization.reload
          expect(organization.name).to eq("New name")
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "with valid params" do
      context "with a logged user" do
        it "deletes the organization" do
          login(member.user)

          expect {
            delete :destroy, id: organization.id
          }.to change(Organization,:count).by(-1)
        end
      end
    end
  end

end
