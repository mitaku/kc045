# -*- coding: utf-8 -*-
#
module TimetablesHelper

  # 上手く切り出して実装をしない方向に持っていきたいな…
  # クラスにしたいし・・・うーん('A
  # 13:00 開場
  # 13:30 開始
  # 14:00 発表 * 10
  # 15:00 休憩
  # 15:10 発表 * 10
  # 16:10 休憩
  # 16:20 発表 * 10
  # 17:30 クロージング
  # 18:00 懇親会

  private
  def opening(start_at)
    [].tap do |list|
      list << {:id => nil, :title => "開場・受付開始", :speaker => "", :start_at => start_at}
      list << {:id => nil, :title => "オープニング", :speaker => "運営", :start_at => start_at + 30.minutes}
    end
  end

  def closing(start_at)
    [].tap do |list|
      list << {:id => nil, :title => "告知タイム", :speaker => "", :start_at => start_at}
      list << {:id => nil, :title => "クロージング", :speaker => "", :start_at => start_at += 15.minutes}
      list << {:id => nil, :title => "記念撮影", :speaker => "運営", :start_at => start_at += 5.minutes}
      list << {:id => nil, :title => "懇親会 - 野良LTも受け付けます!", :speaker => "", :start_at => DateTime.new(2011, 4, 14, 18, 00)}
      list << {:id => nil, :title => "撤収 - 気をつけてお帰り下さい。", :speaker => "", :start_at => DateTime.new(2011, 4, 14, 19, 30)}
    end
  end

  def talk(start_at, num = 0)
    [].tap do |talks|
      speakers[num].each do |talk_id|
        begin
          t = Talk.includes(:user).find(talk_id)
          talks << {:id => t.id, :title => t.title, :speaker => t.user.screen_name, :start_at => start_at}
          start_at += (t.time + 60).seconds
        rescue ActiveRecord::RecordNotFound
          talks << {:id => nil, :title => "当日枠", :speaker => "開場にて", :start_at => start_at}
          start_at += 360.seconds
        end
      end
      talks << {:id => nil, :title => "--- 休憩 ---", :speaker => "", :start_at => start_at}
    end
  end

  def speakers
    [[12, 20, 2, 10, 31, 7, 19, 23, 8, 5], [17, 28, 22, 11, 16, 1, 4, 9], [15, 26, 25, 33, 24, 21, 29, 47, 32, 14]]
  end
end
