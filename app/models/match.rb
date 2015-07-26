class Match < ActiveRecord::Base
  validate :no_match_with_himself

  def no_match_with_himself
    if winner_player_id == loser_player_id
      errors.add(:match, "can't be between the same player")
    end
  end
end
