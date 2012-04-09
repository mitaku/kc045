# -*- coding: utf-8 -*-

module ApplicationHelper
  def footer
    capture_haml do
      haml_tag :p, "&copy; Takumi MIURA 2012".html_safe
    end
  end

  def participants_of_party_count
    "#{Profile.is_attend_party.count}名"
  end

  def countdown_label(date = Date.new(2012, 4, 14))
    case date <=> Date.today
    when  1 # 開催前: あとn日
      "開催まであと#{(date - Date.today).to_i}日"
    when  0 # 開催日: 本日開催
      "本日開催"
    when -1 # 開催後: 開催終了
      "開催は終了しました。"
    else
      nil
    end
  end

  def participant
    "#{User.count}/#{User::LIMIT}"
  end

  def can_attend?
    !!(User.count < User::LIMIT)
  end

  def follow_button(_screen_name)
    screen_name = _screen_name.html_safe
    return <<-BUTTON
    <a href="https://twitter.com/#{screen_name}" class="twitter-follow-button" data-show-count="false">Follow @#{screen_name}</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
    BUTTON
  end
end
