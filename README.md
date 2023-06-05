# WordLogic

This gem implemends logic for the game Wordle

## Usage

include module "WordLogic" where you want to use the logic of this gem
first, set a word as a goal via "set_word", "set_random_word" or "set_random_word_by_l"
then run in_out with the entered word as parameter, the function returns the current state of the game where 0 is gray, 1 is yellow and 2 is green for each letter of the checked word as in normal game of wordle, remaining tries, current word and its length can be checked via "tries", "word" and "word_length"

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tlotro/WordLogic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Tlotro/WordLogic/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordLogic project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Tlotro/WordLogic/blob/main/CODE_OF_CONDUCT.md).
