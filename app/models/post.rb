class Post < ApplicationRecord
    validates_presence_of :title, :text

    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings 

    def all_tags 
        tags.map(&:name).join(",")
    end

    def all_tags=(names)
		self.tags = names.split(',').map do |name| 
			Tag.where(name: name).first_or_create!
		end
	end

    def self.tagged_with(name)
        tag.find_by(name: name).post 
    end

    has_many :comments, dependent: :destroy
    belongs_to :user
   

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    #has_many :likes, dependent: :destroy
    #def already_likes?(post) 
        #self.likes.find(:all, :condition => ['post_id = ?', post.id]).size > 0
    #end

    def publish_month 
        published_at.strftime("%B %Y")
    end

    searchable do
        text :title, :text
        text :all_tags
        text :user_name do
            user.name
        end
        
        text :comments do 
            comments.map(&:post)
        end
        time :created_at 
    end

    has_many :likes
    has_and_belongs_to_many :categories
    
end
