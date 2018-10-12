class Url < ApplicationRecord
  belongs_to :user

  validates :shortened_code, presence: true, uniqueness: {scope: :user_id}
  validates :name, :url, :ref, :extra, :ie, :user_id, presence: true
  validates_format_of :url,
                      with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/

  before_validation :generate_short_code

  has_many :keywords, dependent: :delete_all
  accepts_nested_attributes_for :keywords, reject_if: :all_blank, allow_destroy: true

  # LETTERS = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten.freeze
  # LETTERS = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z).freeze
  LETTERS = (('0'..'9').to_a+('A'..'Z').to_a+('a'..'z').to_a).freeze

  def make_full_url
    keyword = find_keyword
    "#{url}#{ref}#{keyword.page}?#{extra}#{CGI::escape(keyword.text)}&page=#{keyword.page}&ie=#{ie}&qid=#{Time.now.to_i}"
  end

  def find_keyword
    make_keywords_for_select.sample
  end

  def make_keywords_for_select
    arr = []
    keywords.each do |k|
      k.weight.times do
        arr << k
      end
    end
    arr
  end
  
  def generate_short_code
    # here we assign a short_url
    # here we check the DB to make sure the generated short_url above doesn't
    # already exist in the DB. We generate a new short_url until we are sure that
    # it doesn't match an existing short_url
    if self.shortened_code.blank?
      begin
        self.shortened_code = generate_code
      end until Url.find_by(shortened_code: self.shortened_code).nil?
    end
  end

  private

  def generate_code
    # puts 'Generate!'
    6.times.map{LETTERS.sample}.join
  end


end
