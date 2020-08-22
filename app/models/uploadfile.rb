class Uploadfile < ApplicationRecord
  def self.read
    File.read("#{Rails.root}/app/assets/sample.txt").chomp
  end
end
