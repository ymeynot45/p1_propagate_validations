class Event < ActiveRecord::Base
    validates :organizer_name, presence: :true
    validates :organizer_email, presence: :true, format: {with: /\b[&.+.A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,6}/, message: "Please enter a valid email address."}
    validates :title, presence: :true, uniqueness: :true
    validates :date, presence: :true

  def valid_date?
    unless Chronic.parse(date, context: :future)
      errors.add(:from_date, "is missing or invalid")
    end
  end

end