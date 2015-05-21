class Todo < ActiveRecord::Base
  after_initialize :set_default_val
  validates :title, presence: true

  private

  def set_default_val
    self.category ||= '未分類'
  end
end
