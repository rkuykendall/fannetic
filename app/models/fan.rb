class Fan < ActiveRecord::Base
  has_many :teams, :through => :follows
  has_many :events, :through => :tickets
  has_many :tickets
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |fan|
      fan.provider = auth.provider
      fan.uid = auth.uid
      fan.email = auth.info.email
      fan.password = Devise.friendly_token[0,20]
      
	    fan.name = auth.info.name if auth.info.name
	    fan.nickname = auth.info.nickname if auth.info.nickname
	    fan.first_name = auth.info.first_name if auth.info.first_name
	    fan.last_name = auth.info.last_name if auth.info.last_name
      
	    fan.image = auth.info.image if auth.info.image

	    fan.location = auth.info.location if auth.info.location
	    fan.hometown = auth.extra.raw_info.hometown.name if auth.extra.raw_info.hometown.name

	    fan.gender = auth.extra.raw_info.gender if auth.extra.raw_info.gender

	    fan.urls = auth.info.urls.Facebook if auth.info.urls.Facebook
	    fan.verified = auth.info.verified if auth.info.verified

	    fan.timezone = auth.extra.raw_info.timezone if auth.extra.raw_info.timezone
	    fan.locale = auth.extra.raw_info.locale if auth.extra.raw_info.locale
      
	    fan.expires = auth.credentials.expires if auth.credentials.expires
	    fan.expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |fan|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        fan.email = data["email"] if fan.email.blank?
      end
    end
  end
  
  
  def is_admin?
    if ['1517040135','3103485'].include?(uid)
      return true
    else
      return false
    end
  end

end
