This is just a quickly hacked together slack-bot meant to work together with [https://github.com/swiknaba/cringle_money].

# HOW TO
head to [http://slack.com/services/new/bot] and register a new bot

copy the token

head to command line:
- bundle install
- export CURRENCYLAYER_API_KEY=YOU_KEY_HERE
- SLACK_API_TOKEN=YOUR_SLACK_TOKEN bundle exec ruby app/services/cringle_money_bot.rb

Text the bot:
- help
- 10 eur to cny
- 10 eur to usd, aud
- eur to usd, cny
- eur to gbp
