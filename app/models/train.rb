class Train < ApplicationRecord

  validates :destination, presence: true
  validates :origin, presence: true
  validates :remarks_boarding, presence: true
  validates :service, presence: true
  validates :trainno, presence: true

  validates :scheduled, length: { is: 4 }
  validates :scheduled24, length: { is: 4 }
  validates :newtime, length: { is: 4 }, allow_blank: true
  validates :newtime24, length: { is: 4 }, allow_blank: true

end
