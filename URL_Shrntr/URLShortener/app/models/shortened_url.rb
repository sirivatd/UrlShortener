# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint(8)        not null, primary key
#  short_url :string
#  user_id   :integer
#  long_url  :string
#

class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :User 
    
  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit
    
  has_many :visitors, 
    through: :visits, 
    source: :visitor 
  
    
    def self.random_code
      short_url = SecureRandom.urlsafe_base64(16)
      
      while ShortenedUrl.where(short_url: short_url).exists?
        short_url = SecureRandom.urlsafe_base64(16)
      end
      short_url
    end
    
    def self.shorten(user, long_url)
      ShortenedUrl.new(
        short_url: ShortenedUrl.random_code, 
        long_url: long_url, 
        user_id: user.id
      ).save
    end
end
