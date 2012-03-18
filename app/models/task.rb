class Task
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps

  field :description, type: String
  field :completed,   type: Boolean, default: false
  field :due,         type: Date
  field :note,        type: String

  index :due

  # embedded_in :list, inverse_of: :tasks
  belongs_to :list

  validates :description,
            presence: true,
            length: { maximum: 255 }

  validates :list_id, presence: true

  # validates :due, presence: true
end
