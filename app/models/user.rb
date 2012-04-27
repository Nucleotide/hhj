class User
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :first_name, :last_name, :email, allow_blank: false, presence: true

  field :pricipal_name, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :univesity_domain, type: String
  field :email, type: String
  field :phone, type: String
  field :role, type: String

  has_many :position_applications
  has_many :members

  def full_name
    first_name + ' ' + last_name
  end

  def university
    university_domain.split(".").first
  end

  def self.update_or_create_from_env(env)
    attrs = env_to_attributes(env)
    pn = attrs[:principal_name]
    if pn
      user = find_or_create_by principal_name: pn
      user.update_attributes!(attrs)
      user
    end
  end

  def self.env_to_attributes(env)
    # The environment variables in this block need to be
    # configured in Shibboleth.
    return {
      principal_name: env["A_PRINCIPAL_NAME"],
      first_name: env["A_GIVEN_NAME"],
      last_name: env["A_SURNAME"],
      email: env["A_MAIL"],
      phone: env["A_MOBILE"],
      university_domain: env["A_HOME_ORGANIZATION"]
    }
  end

  def can_edit_call_results?
    true
  end
end
