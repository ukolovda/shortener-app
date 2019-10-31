require 'csv'
module Concerns::CsvExportable
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv(attributes, options = {})
      CSV.generate({headers: true}.merge(options)) do |csv|
        csv << attributes

        all.each do |user|
          csv << attributes.map{ |attr| user.send(attr) }
        end
      end
    end
  end

end