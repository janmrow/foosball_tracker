class Player < ActiveRecord::Base
  validates :nickname, presence: true, uniqueness: true;
  validates :firstname, :lastname, presence: true;
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
    "#{firstname} #{lastname}"
  end
end
