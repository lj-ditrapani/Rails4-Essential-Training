module ApplicationHelper

  def error_messages_for(object)
    render(partial: 'application/error_messages',
           locals: { object: object })
  end

  STATUS_MAP = {
    true => [:true_text, 'status true'],
    false => [:false_text, 'status false']
  }
  def status_tag(boolean, options = {})
    key, class_name = STATUS_MAP[boolean]
    content_tag(:span, options[key] || '', class: class_name)
  end
end
