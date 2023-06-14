class User < ApplicationRecord
  include BCrypt
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks
  has_many :comments
  has_many :update_logs
  has_many :assigned_tasks, through: :assignments, source: :task
  has_many :update_logs

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }

  attr_accessor :password

  before_save :encrypt_password


  enum role: { group_leader: 'group_leader', task_leader: 'task_leader', member: 'member' }

  def encrypt_password
    self.password_digest = Password.create(password)
  end

  def authenticate(password)
    Password.new(password_digest) == password
  end

  def create_user_with_credentials(name, email)
    password = generate_password
    create(name: name, email: email, password: password)
    password
  end

  def generate_password
    SecureRandom.alphanumeric(8)
  end

  def update_user_information(name, email, role, label)
    update(name: name, email: email, role: role, label: label)
  end

  def assign_task(task)
    assigned_tasks << task
  end

  def add_comment(task, note)
    comments.create(task: task, note: note)
  end

  def assigned_tasks_by_label(label)
    assigned_tasks.joins(:label).where(labels: { tag: label })
  end

  def assigned_tasks_by_status(status)
    assigned_tasks.where(status: status)
  end

  def add_update_log(task, note)
    update_logs.create(task: task, note: note)
  end

end

