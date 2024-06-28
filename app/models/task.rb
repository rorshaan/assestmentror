class Task < ApplicationRecord
  enum status: {
    to_do: 'To Do',
    in_progress: 'In Progress',
    completed: 'Completed'
  }

  validates :title, :description, presence: true

  validate :validate_to_do_task, if: -> { status == 'to_do' }, on: :create

  scope :to_do, -> { where(status: :to_do) }

  def validate_to_do_task
    if Task.to_do.count >= 2 && !task_valid?
      errors.add(:base, 'Unable to create task. First complete all To Do tasks or reduce To Do tasks to less than 50% of total.')
    end
  end

  def task_valid?
    Task.to_do.count <= (Task.count * 0.5).floor
  end
end
