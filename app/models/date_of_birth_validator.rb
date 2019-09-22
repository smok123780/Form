class DateOfBirthValidator < ActiveModel::Validator
  def validate(record)
    date = record.date_of_birth
    return if date.nil?

    unless date < Date.today
      record.errors[:date_of_birth] << "Date of birth can't be in the future!"
    end
  end
end
