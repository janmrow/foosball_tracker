class Player < ActiveRecord::Base
  validates :nickname, presence: true, uniqueness: true;
  validates :firstname, :lastname, presence: true;
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
    "#{firstname} #{lastname} (#{nickname})"
  end

  def wins
    Match.where(winner_player_id: self.id) 
  end

  def losts
    Match.where(loser_player_id: id)
  end

  def number_of_wins
    wins.count
  end

  def number_of_losts
    losts.count
  end

  def number_of_matches
    wins.count + losts.count
  end

  def points_earned
    @points = wins.count * 10
    losts.each do |lost|
      @points = @points + lost.loserscore
    end
    @points
  end

  def points_lost
    @points = losts.count * 10
    wins.each do |win|
      @points = @points + win.loserscore
    end
    @points
  end

  def simple_rank_points
    number_of_wins * 0.6 - number_of_losts * 0.2 + points_earned * 0.1 - points_lost * 0.1 
  end

  def simple_rank
    @players = Player.all
    @players.sort_by { |player| player.simple_rank_points }
  end
end
