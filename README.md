# RudslRails

rudsl_rails makes it easier to use rudsl in your Rails project. The recommended organisation of your rudsl views are into cards that can be rendered directly, or as part of an non-rudsl view.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rudsl_rails'
```

And then execute:

    $ bundle

## Usage

The gem provides a generator to help organise the cards. Run

```ruby
rails generate rudsl_card users/profile
```

This will generate a new card in `app/cards/users/` called `profile_card.rb` which can be used as follows:

```ruby
render html: Users::ProfileCard.new(current_user).html
```

assuming, that the `profile_card.rb` looks as follows:

```ruby
class Users:ProfileCard < RudslRails::Card
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def node
    div class: 'profile-card' do
      h3 user.name
      img src: user.photo.url, class: 'responsive-image'
      p do
        user.bio
      end
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/sparkymat/rudsl_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
