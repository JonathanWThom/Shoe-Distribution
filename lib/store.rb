class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_save(:titleize)

  private

  define_method(:titleize) do
    self.name=(name().titleize())
  end
end
