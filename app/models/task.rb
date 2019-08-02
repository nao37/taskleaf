class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 30}
  validate :validate_name_not_including_comma

  before_validation :set_description_if_none

  belongs_to :user

  scope :recent, -> {order(created_at: :desc)}

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

  def set_description_if_none
    self.description = '詳細なし' if description.blank?
  end
end
