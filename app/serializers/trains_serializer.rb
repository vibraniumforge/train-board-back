class TrainsSerializer < ActiveModel::Serializer
  attributes :id, :destination, :newtime, :newtime24, :origin, :remarks_boarding, :scheduled, :scheduled24, :service, :trainno
end
