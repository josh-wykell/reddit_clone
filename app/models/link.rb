class Link < ActiveRecord::Base
  require 'uri'
  include Commentable

  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  acts_as_votable

  validates :url, :format => {:with => URI.regexp}
  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).links
  end
end
