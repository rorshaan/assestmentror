FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    description { "Task description" }
    status { 'To Do' }

    trait :in_progress do
      status { 'In Progress' }
    end

    trait :completed do
      status { 'Completed' }
    end
  end
end