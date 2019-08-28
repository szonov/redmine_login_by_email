require 'redmine'
require 'redmine_login_by_email'

Redmine::Plugin.register :redmine_login_by_email do
  name "Login by Email"
  author 'Sergey Zonov'
  description 'Allow login to redmine with email instead of username'
  version '0.0.1'
  url 'https://github.com/szonov/redmine_login_by_email'
  author_url 'mailto:sergey@zonov.com'

  requires_redmine :version_or_higher => '3.0'

  settings :default => {
    :use_login_by_email => false,
  }, :partial => 'settings/login_by_email/login_by_email'

end
