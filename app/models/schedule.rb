class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }
  validate :date_before_start
  validate :date_before_end

  def date_before_start
    if start_date.blank?
      return
    end

    if start_date < Date.today
      errors.add(:start_date, "：今日以降の日付を選択してください")
    end
  end

  def date_before_end
    if end_date.blank?
      return
    end

    if end_date < start_date
      errors.add(:end_date, "：開始日以降の日付を選択してください")
    end
  end
end
