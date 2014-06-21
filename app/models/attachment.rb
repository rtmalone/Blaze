class Attachment < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
    belongs_to :entry
end
