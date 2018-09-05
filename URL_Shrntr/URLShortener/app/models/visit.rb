# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  url_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
  
  def self.record_visit!(user, short_url)
    Visit.new(user_id: user.id, url_id: short_url.id).save
  end
  
  belongs_to :visitor, 
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :url,
  primary_key: :id,
  foreign_key: :url_id,
  class_name: :ShortenedUrl
  
  
end
