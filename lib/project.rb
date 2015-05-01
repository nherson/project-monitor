class Project < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :group_number, uniqueness: true, presence: true
  validates :github_shortname, uniqueness: true, presence: true
  validates :github_shortname, format: { with: /(.*)\/(.*)/ ,
                                         message: "repository must be of format 'user/repo'" }

  def github_url
    "https://github.com/#{github_shortname}"
  end

end
