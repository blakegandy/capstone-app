class Appointment < ApplicationRecord
  belongs_to :stylist, foreign_key: "stylist_id", class_name: "User"
  belongs_to :client, foreign_key: "client_id", class_name: "User"

  def starts_at_date=(date)
    @starts_at_date = date
    set_starts_at
    date
  end

  def starts_at_time(time)
    @starts_at_time = time
    set_starts_at
    time
  end

  def starts_at_date
    starts_at&.strftime('%m/%d/%Y')
  end

  def starts_at_time
    starts_at&.strftime('%H:%M')
  end

  private

    def set_starts_at
      if @starts_at_date && @starts_at_time
        self.starts_at = Time.zone.parse("#{@starts_at_date} #{@starts_at_time}")
      end
    end
end
