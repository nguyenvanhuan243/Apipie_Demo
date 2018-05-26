class User < ActiveRecord::Base
  has_many :tweets
  has_many :addresses
  has_many :comments
end

# Why using has_many: From a user, we can access to all addresses or comments,...
# How to access all tweets: User.find(:id).tweets
# How to access all addresses: User.find(:id).addresses
# How to access all comments: User.find(:id).comments
# See this tut to understand more: http://guides.rubyonrails.org/association_basics.html#the-has-many-association