module SharedHelper

  def resource_attribute_errors(resource, attribute, error_types: [], method_for_retrieve_message: :full_message)
    resource.errors.where(attribute).reduce([]) do |error_messages, error|
      next error_messages if error_types.any? && !error_types.include?(error.type)

      error_messages << t(['errors', error.attribute, error.type].join('.').prepend('.'), raise: true)
    rescue I18n::MissingTranslationData => e
      error_messages << error.public_send(method_for_retrieve_message)
    end
  end

end
