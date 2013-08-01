class Event < ActiveRecord::Base
    validates :organizer_name, presence: :true
    validates :organizer_email, presence: :true, format: {with: /\b[&.+.A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,6}/, message: "Please enter a valid email address."}
    validates :title, presence: :true, uniqueness: :true
    validates :date, presence: :true
    validate  :date_in_future?

  def date_in_future?
    unless date != nil && date > Date.today
      self.errors.add(:date, "Must pick a future date.")
    end
  end
end
