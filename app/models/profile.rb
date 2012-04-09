class Profile < ActiveRecord::Base
  include Enumerize

  belongs_to :user

  attr_accessible :name, :phonetic_name, :blog, :hometown, :comment, :age, :attend_parties

  validates :name, :presence => true, :length => {:maximum => 60}
  validates :phonetic_name, :length => {:maximum => 60}
  validates :blog, :length => {:maximum => 200}
  validates :comment, :length => {:maximum => 140}
  validates :age, :numericality => {:only_integer => true, :allow_blank => true}

  scope :is_attend_party, where(:attend_parties => true)


  enumerize :hometown, :in => [
                               :secret,
                               :hokkaido,
                               :aomori,
                               :iwate,
                               :miyagi,
                               :akita,
                               :yamagata,
                               :fukushima,
                               :ibaraki,
                               :tochigi,
                               :gunma,
                               :saitama,
                               :chiba,
                               :tokyo,
                               :kanagawa,
                               :niigata,
                               :toyama,
                               :ishikawa,
                               :fukui,
                               :yamanashi,
                               :nagano,
                               :gifu,
                               :shizuoka,
                               :aichi,
                               :mie,
                               :shiga,
                               :kyoto,
                               :osaka,
                               :hyogo,
                               :nara,
                               :wakayama,
                               :tottori,
                               :shimane,
                               :okayama,
                               :hiroshima,
                               :yamaguchi,
                               :tokushima,
                               :kagawa,
                               :ehime,
                               :kochi,
                               :fukuoka,
                               :saga,
                               :nagasaki,
                               :kumamoto,
                               :oita,
                               :miyazaki,
                               :kagoshima,
                               :okinawa
                              ], :default => :secret

end
