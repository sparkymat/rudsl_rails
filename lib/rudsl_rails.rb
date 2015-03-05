require "rudsl_rails/version"

module RudslRails
  class Card
    include Rails.application.routes.url_helpers
    include Rudsl
    include UsersHelper
    include ApplicationHelper
    include ActionView::Helpers::AssetUrlHelper
    include ActionView::Helpers::AssetTagHelper
    include ERB::Util
    include ActionView::Helpers::TranslationHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::TextHelper

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
      end
      view.render args.first
    end
  end
end
