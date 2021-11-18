# README

* User

|  Name  |  culumn  |
| ---- | ---- |
|  id  |  integer  |
|  name  |  string  |
|  email  |  string  |
|  password_digest  |  string  |

* Task

|  Name  |  culumn  |
| ---- | ---- |
|  user_id  |  bigint  |
|  title  |  string  |
|  content  |  text  |
|  status  |  integer  |
|  deadline  |  date  |
|  priority  |  integer  |

* Label

|  Name  |  culumn  |
| ---- | ---- |
|  task_id  |  bigint  |
|  name  |  string  |

|  Herokuへのデプロイ方法  |
| ---- |
|  1.アセットプリコンパイルをする  |
|  :$ rails assets:precompile RAILS_ENV=production  |
|  2.コミットする  |
|  :$ git add .  |
|  :$ git commit -m "〜"  |
|  3.Herokuに新しいアプリケーションを作成  |
|  :$ heroku create  |
|  4.Herokuにデプロイをする  |
|  :$ git push heroku master  |
|  5.データベースの変更内容を更新  |
|  :$ heroku run rails db:migrate  |

