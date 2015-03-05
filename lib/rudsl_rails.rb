require "rudsl_rails/version"
require "rudsl"

module RudslRails
  class Card < ActionView::Base
    include Rudsl
    include ERB::Util

    def method_missing(method_sym, *arguments, &block)
      if method_sym.to_s.end_with?("_path") || method_sym.to_s.end_with?("_url")
        Rails.application.routes.url_helpers.send(method_sym, arguments, &block)
      else
        super
      end
    end

    def node
      # implement node here
    end

    def html
      render html: node.try(:to_s).try(:html_safe)
    end

    def render(*args)
      view = ActionView::Base.new(Rails.configuration.paths['app/views'])
      view.class_eval do
        include Rails.application.routes.url_helpers
        include ApplicationHelper
      end
      view.render args.first
    end
  end
end
