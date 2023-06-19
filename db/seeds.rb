# This seed file is used to populate the database with initial data.
# You can run it using the `bin/rails db:seed` command.

# Create labels
label1 = Label.create(tag: "FE", description: "Front End Tasks")
label2 = Label.create(tag: "BE", description: "Back End Tasks")
label3 = Label.create(tag: "TE", description: "Test Functionality")

# Create users
user1 = User.create(name: "John Doe", email: "john@example.com", password: "password", role: "group_leader", label_id: label3.id)
user2 = User.create(name: "Jane Smith", email: "jane@example.com", password: "password", role: "member", label_id: label1.id)
user3 = User.create(name: "Juan Dela Cruz", email: "juan@example.com", password: "password", role: "member", label_id: label2.id)
user4 = User.create(name: "Juana Dela Cruz", email: "juana@example.com", password: "password", role: "member", label_id: label3.id)


# Create tasks
task1 = Task.create(title: "Create UI for home page", status: "Pending", description: "Description 1", label_id: label1.id, user_id: user2.id)
task2 = Task.create(title: "Implement authentication mechanism", status: "Completed", description: "Description 2", label_id: label2.id, user_id: user3.id)
task3 = Task.create(title: "Test UI functionalities", status: "Pending", description: "Description 3", label_id: label3.id, user_id: user4.id)

# Create comments
Comment.create(note: "Great start! The layout looks clean and organized.", task_id: task1.id, user_id: user1.id)
Comment.create(note: "Consider adding some unit tests for the code you modified", task_id: task1.id, user_id: user1.id)
Comment.create(note: "Don't forget to test responsive design for different screen sizes.", task_id: task1.id, user_id: user1.id)

# Create deadlines
Deadline.create(date: Date.today, task_id: 1)
Deadline.create(date: Date.tomorrow, task_id: 2)
Deadline.create(date: Date.today + 2, task_id: 3)

# Create update logs
UpdateLog.create(note: "Update Log 1", task_id: 1)
UpdateLog.create(note: "Update Log 2", task_id: 2)
UpdateLog.create(note: "Update Log 3", task_id: 3)
