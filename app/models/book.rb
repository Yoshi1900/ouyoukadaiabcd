class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  has_many :book_relationships, dependent: :destroy
  has_many :tags, through: :book_relationships


scope :latest, -> {order(create_at: :desc)}
scope :old, -> {order(created_at: :asc)}
scope :star_count, -> {order(star: :desc)}


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('name LIKE ?', '%' + content)
    else
      Book.where('name LIKE ?', '%' + content + '%')
    end
  end

  def save_tags(savebook_tags)
    savebook_tags.each do |new_name|
      book_tag = Tag.find_or_create_by(name: new_name)
      self.tags << book_tag
    end
  end

end
