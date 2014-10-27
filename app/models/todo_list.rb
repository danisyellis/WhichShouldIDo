class TodoList < ActiveRecord::Base
  has_many :items
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
end
