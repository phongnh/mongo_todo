class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :completed,   type: Boolean, default: false
  field :due,         type: Date
  field :note,        type: String

  index :due

  embedded_in :list

  validates :description,
            presence: true,
            length: { maximum: 255 }

  # validates :due, presence: true
end
