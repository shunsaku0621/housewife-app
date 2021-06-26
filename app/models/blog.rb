class Blog < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
    validates :start_time
  end
end
