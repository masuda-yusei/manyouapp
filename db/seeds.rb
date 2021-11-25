# User.create!(
#   name: 'test1',
#   email: 'test1@email.com',
#   password: '12345678',
#   password_confirmation: '12345678',
# ) 
# User.create!(
#   name:  '管理者2',
#   email: 'xxx@email.com',
#   password: '12345678',
#   password_confirmation: '12345678',
#   admin: true
# ) 

Task.create!(
  title: '障害対応',
  content: 'DBのデータが反映されない',
  deadline: '2020-01-01',
  status: '未着手',
  priority: '低'
)
Task.create!(
  title: '商談',
  content: 'プレゼン資料作成',
  deadline: '2020-02-02',
  status: '未着手',
  priority: '中',
)
Task.create!(
  title: '定例会',
  content: '定例会で必要な資料作成',
  deadline: '2020-03-03',
  status: '着手中',
  priority: '高',
)
Task.create!(
  title: '営業',
  content: 'プロダクトの営業',
  deadline: '2020-04-04',
  status: '完了',
  priority: '低',
)
Task.create!(
  title: '社内学習',
  content: '不明点の洗い出し',
  deadline: '2020-05-05',
  status: '着手中',
  priority: '中',
)
Task.create!(
  title: '電話対応',
  content: 'サービスの使用状況確認',
  deadline: '2020-06-06',
  status: '着手中',
  priority: '高',
)
Task.create!(
  title: 'キャパ数確認',
  content: '来年度サービス使用者の洗い出し',
  deadline: '2020-07-07',
  status: '未着手',
  priority: '低',
)
Task.create!(
  title: 'サポート対応',
  content: 'サポートサイト経由での対応',
  deadline: '2020-08-08',
  status: '完了',
  priority: '中',
)
Task.create!(
  title: '週例会',
  content: '毎週実施のタスク内容の洗い出し',
  deadline: '2020-09-09',
  status: '未着手',
  priority: '高',
)
Task.create!(
  title: '朝礼担当',
  content: '朝礼担当者の一覧',
  deadline: '2020-10-10',
  status: '着手中',
  priority: '高',
)

Label.create!(name: '東大')
Label.create!(name: '早稲田')
Label.create!(name: '慶應')
Label.create!(name: '上智')
Label.create!(name: '国際基督教')
Label.create!(name: '青山学院')
Label.create!(name: '立教')
Label.create!(name: '中央')
Label.create!(name: '明治')
Label.create!(name: '社内タスク')

User.create!(
  name: 'test001',
  email: 'test001@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test002',
  email: 'test002@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test003',
  email: 'test003@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test004',
  email: 'test004@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test005',
  email: 'test005@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test006',
  email: 'test006@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test007',
  email: 'test007@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test008',
  email: 'test008@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test009',
  email: 'test009@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
User.create!(
  name: 'test010',
  email: 'test010@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)