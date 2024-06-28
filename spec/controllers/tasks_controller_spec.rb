require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let(:task) { FactoryBot.create(:task) }

    it "returns a success response" do
      get :show, params: { id: task.id }
      expect(response).to have_http_status(:ok)
    end

    it "returns a not found response" do
      get :show, params: { id: 'invalid_id' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "POST #create" do
    let(:valid_params) { { task: { title: "New Task", description: "Description", status: "To Do" } } }
    let(:invalid_params) { { task: { title: "", description: "Description", status: "To Do" } } }

    context "with valid params" do
      it "creates a new task" do
        expect {
          post :create, params: valid_params
        }.to change(Task, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "does not create a new task" do
        expect {
          post :create, params: invalid_params
        }.to_not change(Task, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    let(:task) { FactoryBot.create(:task) }
    let(:valid_params) { { id: task.id, task: { title: "Updated Task" } } }
    let(:invalid_params) { { id: task.id, task: { title: "" } } }

    context "with valid params" do
      it "updates the requested task" do
        put :update, params: valid_params
        task.reload
        expect(task.title).to eq("Updated Task")
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "does not update the task" do
        put :update, params: invalid_params
        task.reload
        expect(task.title).not_to eq("")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:task) { FactoryBot.create(:task) }

    it "destroys the requested task" do
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
