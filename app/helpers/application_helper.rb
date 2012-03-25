# -*- coding: utf-8 -*-

module ApplicationHelper
  def footer
    capture_haml do
      haml_tag :p, "&copy; Takumi MIURA 2012".html_safe
    end
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
end
