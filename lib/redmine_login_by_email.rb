Rails.configuration.to_prepare do
  require_dependency 'redmine_login_by_email/patches/user_patch'
end

module RedmineLoginByEmail

end
