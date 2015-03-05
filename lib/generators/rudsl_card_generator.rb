class RudslCardGenerator < Rails::Generators::NamedBase
  def create_helper_file
    create_file "app/cards/#{class_name.split("::").map(&:underscore).join("/")}_card.rb", <<-FILE
class #{class_name}Card < RudslRails::Card
  # TODO: Example arguments
  #attr_reader :arg

  # TODO: Example constructor for saving relevant objects
  #def initialize(arg)
  #  @arg = arg
  #end

  # TODO: The 'node' method is where the DOM should be created.
  def node
    #div do
    #  h1 @arg.to_s
    #end
  end
end
      FILE
  end
end
