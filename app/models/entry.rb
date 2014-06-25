class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments
  default_scope {order('created_at DESC')}
end
