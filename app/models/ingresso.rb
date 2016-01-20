class Ingresso < ActiveRecord::Base
  belongs_to :tipo

  before_create :generateCode
  validates :tipo_id, presence: true

  def generateCode
    self.code = "1234"
  end

end
