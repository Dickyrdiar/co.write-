class Post < ApplicationRecord
    validates_presence_of :title, :text

    #has_many :taggings, dependent: :destroy
    #has_many :tags, through: :taggings 

    has_many :comments, dependent: :destroy
    belongs_to :user
   

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    acts_as_taggable_on :tags
   
    #has_many :likes, dependent: :destroy
    #def already_likes?(post) 
        #self.likes.find(:all, :condition => ['post_id = ?', post.id]).size > 0
    #end
    has_and_belongs_to_many :categories

    def publish_month 
        published_at.strftime("%B %Y")
    end

    searchable do
        text :title, :text
        text :tag_list
        
        text :comments do 
            comments.map(&:post)
        end
        time :created_at 
    end

    has_many :likes
  
    
end
