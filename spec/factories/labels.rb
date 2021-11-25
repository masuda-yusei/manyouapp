FactoryBot.define do
  factory :label do
    name {'社内タスク'}
  end
  factory :label2, class: Label do
    name {'社外タスク'}
  end
  factory :label3, class: Label do
    name {'社内研修'}
  end
end
