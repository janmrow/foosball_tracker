class Player < ActiveRecord::Base
  validates :nickname, presence: true, uniqueness: true;
  validates :firstname, :lastname, presence: true;

  def full_name
    "#{firstname} #{lastname}"
  end
end
