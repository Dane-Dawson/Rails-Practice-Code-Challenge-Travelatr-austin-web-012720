class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five_posts
        posts = self.posts
        posts.last(5)
    end

    def most_liked_post
        @post = self.posts.max_by do |post|
            post.likes
        end
    end

    def avg_age
        sum = self.bloggers.sum { |blogger| blogger.age}
        sum / self.bloggers.count
    end

end
