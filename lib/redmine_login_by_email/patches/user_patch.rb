require_dependency 'user'

module RedmineLoginByEmail
  module Patches
    module UserPatch
      def self.included(base)
        base.extend ClassMethods
        base.class_eval do
          class << self
            alias_method :find_by_login_without_use_email_as_login, :find_by_login
            alias_method :find_by_login, :find_by_login_with_use_email_as_login
          end
        end
      end

      module ClassMethods
        def find_by_login_with_use_email_as_login(login)
          user = nil
          if Setting.plugin_redmine_login_by_email['use_login_by_email'].to_i > 0 && login.index('@').to_i > 0
            user = find_by_mail(login)
          end

          unless user
            user = find_by_login_without_use_email_as_login(login)
          end

          user
        end
      end

    end
  end
end

unless User.included_modules.include?(RedmineLoginByEmail::Patches::UserPatch)
  User.send(:include, RedmineLoginByEmail::Patches::UserPatch)
end