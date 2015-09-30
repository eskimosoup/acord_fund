module ApplicationHelper
  def two_tone_title(title)
    size = title.scan(/[\w-]+/).size

    if size > 1
      length = size - 1
      first_word  = title.split(' ').first
      last_words = title.split(' ')[1..length].join(' ')
      "#{first_word} <span class='first-word-emphasis'>#{last_words}</span>".html_safe
    else
      "<span class='first-word-emphasis'>#{title}</span>".html_safe
    end
  end

  def two_tone_comma_separated_title(title)
    size = title.scan(/[\w-]+/).size

    if size > 1
      length = size - 1
      first_word  = title.split(', ').first
      last_words = title.split(', ')[1..length].join(' ')
      "#{first_word}, <span>#{last_words}</span>".html_safe
    else
      "<span>#{title}</span>".html_safe
    end
  end
end
