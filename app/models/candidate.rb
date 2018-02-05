class Candidate < ApplicationRecord

  mount_uploader :image, ImageUploader
  validates_presence_of :image # это чтобы он проверял наличие загружененой фотки, без которой не было возмонжости сохранить ю

  mount_uploader :document, DocumentUploader



  validates_processing_of :image
  validate :image_size_validation



  has_many :comments, dependent: :destroy
  validates :name, presence: true,
            length: { minimum: 5 }




  private
  def image_size_validation
    errors[:image] << "should be less than 2 Megabites" if image.size > 2.megabytes
  end
  
end
