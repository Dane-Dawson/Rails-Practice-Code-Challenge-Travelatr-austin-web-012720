class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}
    validates :age, numericality: {greater_than: 0}

    def last_five_posts
        posts = self.posts
        posts.last(5)
    end

    def total_likes
        self.posts.sum do |post|
            post.likes
        end
    end

    def most_liked_post
        @post = self.posts.max_by do |post|
            post.likes
        end
    end

end