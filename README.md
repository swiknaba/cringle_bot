# HOW TO
head to [http://slack.com/services/new/bot] and register a new bot

copy the token

head to command line:
- bundle install
- export CURRENCYLAYER_API_KEY=YOU_KEY_HERE
- SLACK_API_TOKEN=YOUR_SLACK_TOKEN bundle exec ruby app/models/cringle_money_bot.rb

Text the bot:
- help
- 10 eur to cny
- 10 eur to usd, aud
- eur to usd, cny
- eur to gbp
