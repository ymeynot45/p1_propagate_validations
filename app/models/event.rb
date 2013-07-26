class Event < ActiveRecord::Base
    validates :organizer_name, presence: :true
    validates :organizer_email, presence: :true, format: {with: /\b[&.+.A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,6}/, message: "Please enter a valid email address."}
    validates :title, presence: :true, uniqueness: :true
    validates :date, presence: :true #, numericality: { :greater_than => 0} #currently a string not a number.
    validate :date_in_future?

  def date_in_future?
    unless date > Date.today
      self.errors.add(:date, "Must pick a future date.")
    end
  end
end

# @time =Chronic.parse '2/10/1985' #works


#could I try and use this to do  :date.to_datetime - Datetime.now  ???
  # def self.human_attribute_name(attribute, options = {})
  #   if attribute == :date
  #     attribute = attribute - Datetime.now
  #     return attribute
  #   else
  #     super #explicitly call super so that any attribute other than raw_password
  #   end
  # end
