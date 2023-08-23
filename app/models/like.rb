class Like < ApplicationRecord
  belongs_to :user

  def self.liked?(id1, id2)
    case1 = !Like.where(user_id: id1, post_id: id2).empty?
    case2 = !Like.where(user_id: id2, post_id: id1).empty?
    case1 || case2
  end

  def self.find_like_id(id1, id2)
    if Like.where(user_id: id1, post_id: id2).empty?
      Like.where(user_id: id2, post_id: id1)[0].id
    else
      Like.where(user_id: id1, post_id: id2)[0].id
    end
  end

end
