FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test_title' }
    content { 'test_content' }
    deadline {'2021/11/21'}
    status {'完了'}
    priority {'高'}
  end
  factory :second_task, class: Task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test_title2' }
    content { 'test_content2' }
    deadline {'2021/11/23'}
      status {'未着手'}
      priority {'中'}
  end
end