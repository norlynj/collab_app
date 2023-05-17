
# Create users
User.create(name: "Group Leader", email: "group_leader@example.com", password: "password", role: "group_leader")
User.create(name: "Task Leader", email: "task_leader@example.com", password: "password", role: "task_leader")
User.create(name: "Member", email: "member@example.com", password: "password", role: "member")
User.create(name: "Member 2", email: "member2@example.com", password: "password", role: "member")

# Create labels
label1 = Label.create(tag: "Label 1")
label2 = Label.create(tag: "Label 2")
label3 = Label.create(tag: "Label 3")
label4 = Label.create(tag: "Label 4")

# Create tasks associated with labels
Task.create(title: "Task 1", status: "In Progress", description: "Task 1 Description", label_id: label1)
Task.create(title: "Task 2", status: "Completed", description: "Task 2 Description", label_id: label2)
Task.create(title: "Task 3", status: "In Progress", description: "Task 3 Description", label_id: label3)
Task.create(title: "Task 4", status: "Pending", description: "Task 4 Description", label_id: label4)

# Create comments associated with tasks
task1 = Task.find_by(title: "Task 1")
Comment.create(note: "Comment 1 for Task 1", task: task1)
Comment.create(note: "Comment 2 for Task 1", task: task1)

task2 = Task.find_by(title: "Task 2")
Comment.create(note: "Comment 1 for Task 2", task: task2)
Comment.create(note: "Comment 2 for Task 2", task: task2)

task3 = Task.find_by(title: "Task 3")
Comment.create(note: "Comment 1 for Task 3", task: task3)
Comment.create(note: "Comment 2 for Task 3", task: task3)

task4 = Task.find_by(title: "Task 4")
Comment.create(note: "Comment 1 for Task 4", task: task4)
Comment.create(note: "Comment 2 for Task 4", task: task4)

# Deadlines
Deadline.create(date: Date.today + 7, task: task1)
Deadline.create(date: Date.today + 14, task: task2)
Deadline.create(date: Date.today + 21, task: task3)
Deadline.create(date: Date.today + 30, task: task4)

# Update Logs
UpdateLog.create(note: "Update 1 for Task 1", task: task1)
UpdateLog.create(note: "Update 2 for Task 1", task: task1)
UpdateLog.create(note: "Update 1 for Task 2", task: task2)
UpdateLog.create(note: "Update 2 for Task 2", task: task2)
UpdateLog.create(note: "Update 1 for Task 3", task: task3)
UpdateLog.create(note: "Update 2 for Task 3", task: task3)
UpdateLog.create(note: "Update 1 for Task 4", task: task4)
UpdateLog.create(note: "Update 2 for Task 4", task: task4)
