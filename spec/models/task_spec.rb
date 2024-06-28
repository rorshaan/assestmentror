require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'custom validations' do
    context 'when status is "To Do"' do
      let!(:to_do_task1) { create(:task, status: :to_do) }
      let!(:to_do_task2) { create(:task, status: :to_do) }
      let!(:in_progress_task) { create(:task, status: :in_progress) }

      it 'prevents creation of new "To Do" task if more than 50% are already "To Do"' do
        task = Task.new(title: 'New Task', description: 'Description', status: :to_do)
        expect(task).not_to be_valid
        expect(task.errors[:base]).to include('Unable to create task. First complete all To Do tasks or reduce To Do tasks to less than 50% of total.')
      end

      it 'allows creation of "To Do" task if less than 50% are "To Do"' do
        Task.find(to_do_task2.id).destroy
        task = Task.new(title: 'New Task', description: 'Description', status: :to_do)
        expect(task).to be_valid
      end

      it 'allows creation of other status tasks' do
        task = Task.new(title: 'New Task', description: 'Description', status: :in_progress)
        expect(task).to be_valid
      end
    end
  end

  describe 'scopes' do
    describe '.to_do' do
      let!(:to_do_task) { create(:task, status: :to_do) }
      let!(:in_progress_task) { create(:task, status: :in_progress) }

      it 'returns tasks with status "To Do"' do
        expect(Task.to_do).to include(to_do_task)
        expect(Task.to_do).not_to include(in_progress_task)
      end
    end
  end

  describe 'methods' do
    describe '#task_valid?' do
      let!(:to_do_task1) { create(:task, status: :to_do) }
      let(:to_do_task2) { create(:task, status: :to_do) }
      let!(:in_progress_task) { create(:task, status: :in_progress) }

      it "returns true if less than 50% of tasks are To Do" do
        expect(Task.new.task_valid?).to eq(true)
      end

      it "returns false if 50% or more of tasks are To Do" do
        to_do_task2
        expect(Task.new.task_valid?).to eq(false)
      end
    end
  end
end
