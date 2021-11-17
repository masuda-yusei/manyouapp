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