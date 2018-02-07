require 'csv'

class Candidate < ApplicationRecord

  mount_uploader :image, ImageUploader
  validates_presence_of :image # это чтобы он проверял наличие загружененой фотки, без которой не было возмонжости сохранить ю

  mount_uploader :document, DocumentUploader



  validates_processing_of :image
  validate :image_size_validation



  has_many :comments, dependent: :destroy
  validates :name, presence: true,
            length: { minimum: 5 }

  def self.to_csv
    attributes = %w{name description dev_language status level_skills
      suggest_project contact_data present_job expected_salary final_salary
      data_from cand_comment level_language}    #прописываем какие поля мы хотим в итоге скачать
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |candidate|
        csv << attributes.map{ |attr| candidate.send(attr) }#candidate.attributes.values_at(*attributes)
      end
    end
  end


  private
  def image_size_validation
    errors[:image] << "should be less than 2 Megabites" if image.size > 10.megabytes
  end
  
end
