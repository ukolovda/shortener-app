class SimpleUrl::Click < ApplicationRecord
  include Concerns::CsvExportable

  belongs_to :simple_url

  delegate :name, to: :simple_url, prefix: true, allow_nil: true
end
