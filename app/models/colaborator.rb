class Colaborator < ApplicationRecord
  # incluímos la búsqueda
  include PgSearch::Model
  # se implementa búsqueda por email en primera prioridad, e id como segunda
  pg_search_scope :search_full_text, against: {
    email: 'A',
    id: 'B'
  }
end
