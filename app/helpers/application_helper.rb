module ApplicationHelper

  def show_errors(object, field_name)
    if object.errors.any? && object.errors.messages[field_name].present?
      object.errors.messages[field_name].join(", ").upcase_first
    end
  end
end
