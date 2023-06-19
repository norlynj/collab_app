# This seed file is used to populate the database with initial data.
# You can run it using the `bin/rails db:seed` command.

# Clear existing data from the tables
[Comment, Deadline, Label, Task, UpdateLog, User].each(&:delete_all)

# Create labels
Label.create(tag: "Label 1")
Label.create(tag: "Label 2")
Label.create(tag: "Label 3")

# Create users
User.create(name: "John Doe", email: "john@example.com", password: "password", role: "group_leader")
User.create(name: "Jane Smith", email: "jane@example.com", password: "password", role: "group_leader")

# Create tasks
Task.create(title: "Task 1", status: "Pending", description: "Description 1", label_id: 1)
Task.create(title: "Task 2", status: "Completed", description: "Description 2", label_id: 2)
Task.create(title: "Task 3", status: "Pending", description: "Description 3", label_id: 3)

# Create comments
Comment.create(note: "Comment 1", task_id: 1)
Comment.create(note: "Comment 2", task_id: 2)
Comment.create(note: "Comment 3", task_id: 3)

# Create deadlines
Deadline.create(date: Date.today, task_id: 1)
Deadline.create(date: Date.tomorrow, task_id: 2)
Deadline.create(date: Date.today + 2, task_id: 3)

# Create update logs
UpdateLog.create(note: "Update Log 1", task_id: 1)
UpdateLog.create(note: "Update Log 2", task_id: 2)
UpdateLog.create(note: "Update Log 3", task_id: 3)
