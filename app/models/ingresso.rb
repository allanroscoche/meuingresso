class Ingresso < ActiveRecord::Base
  belongs_to :tipo

  validates :tipo_id, presence: true

  after_create :generate_token

  private

  def generate_token
    update_column :code, SecureRandom.hex(3).upcase
  rescue ActiveRecord::RecordNotUnique => e
    @token_attempts ||= 0
    @token_attempts += 1
    retry if @token_attempts < 3
    raise e, "Retries exhausted"
  end

end
