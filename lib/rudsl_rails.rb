require "rudsl_rails/version"

module RudslRails
  class Card
    include Rudsl
    include ActionView::Helpers::AssetUrlHelper
    include ActionView::Helpers::AssetTagHelper
    include ERB::Util
    include ActionView::Helpers::TranslationHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::TextHelper

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
      node.try(:to_s).try(:html_safe)
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
