class SimpleUrl < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: {scope: :user_id}
  validates :url, presence: true

  before_validation :generate_alias

  LETTERS = (('0'..'9').to_a+('A'..'Z').to_a+('a'..'z').to_a).freeze

  def generate_alias
    # here we assign a short_url
    # here we check the DB to make sure the generated short_url above doesn't
    # already exist in the DB. We generate a new short_url until we are sure that
    # it doesn't match an existing short_url
    if self.alias.blank?
      begin
        self.alias = generate_code
      end until self.class.find_by(alias: self.alias).nil?
    end
  end

  private

  def generate_code
    # puts 'Generate!'
    6.times.map{LETTERS.sample}.join
  end

end
