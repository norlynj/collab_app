class User < ApplicationRecord
  include BCrypt

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :label
  has_many :tasks
  has_many :comments
  has_many :update_logs
  has_many :assigned_tasks, through: :assignments, source: :task
  has_many :update_logs

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }


  enum role: { group_leader: 'group_leader', task_leader: 'task_leader', member: 'member' }

  # Authenticates the user's password
  def authenticate(password)
    Password.new(password_digest) == password
  end

  # Creates a new user with the given name and email, and generates a random password
  # Returns the generated password
  def create_user_with_credentials(name, email)
    password = generate_password
    create(name: name, email: email, password: password)
    password
  end

  # Generates a random password
  def generate_password
    SecureRandom.alphanumeric(8)
  end

  # Updates the user's information with the given name, email, role, and label
  def update_user_information(name, email, role, label)
    update(name: name, email: email, role: role, label: label)
  end

  # Assigns a task to the user
  def assign_task(task)
    assigned_tasks << task
  end

  # Adds a comment to the specified task with the given note
  def add_comment(task, note)
    comments.create(task: task, note: note)
  end

  # Retrieves assigned tasks based on a specific label
  def assigned_tasks_by_label(label)
    assigned_tasks.joins(:label).where(labels: { tag: label })
  end

  # Retrieves assigned tasks based on a specific status
  def assigned_tasks_by_status(status)
    assigned_tasks.where(status: status)
  end

  # Adds an update log entry for the specified task with the given note
  def add_update_log(task, note)
    update_logs.create(task: task, note: note)
  end
end
