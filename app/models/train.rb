class Train < ApplicationRecord

  validates_presence_of :destination, :origin, :remarks_boarding, :service, :trainno

  validates :scheduled, length: { is: 4 }
  validates :scheduled24, length: { is: 4 }
  validates :newtime, length: { is: 4 }, allow_blank: true
  validates :newtime24, length: { is: 4 }, allow_blank: true

end
