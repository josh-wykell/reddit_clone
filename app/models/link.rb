class Link < ActiveRecord::Base
  require 'uri'

  belongs_to :user
  has_many :comments
  acts_as_votable

  validates :url, :format => {:with => URI.regexp}

end
