class Player < ActiveRecord::Base
  validates :nickname, presence: true, uniqueness: true;
  validates :firstname, :lastname, presence: true;
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
    "#{firstname} #{lastname} (#{nickname})"
  end

  def wins
    @wins = Match.where(winner_player_id: self.id) 
  end

  def losts
    @losts = Match.where(loser_player_id: id)
  end
end
