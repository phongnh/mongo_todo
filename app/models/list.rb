class List
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,        type: String
  field :description, type: String

  index :name, unique: true

  # embeds_many :tasks

  has_many :tasks, :dependent => :destroy

  validates :name,
            presence: true,
            length: { maximum: 255 },
            uniqueness: true

  attr_accessible :name, :description

end
