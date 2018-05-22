require 'slack-ruby-bot'
require 'cringle_money'

class CringleMoneyBot < SlackRubyBot::Bot
  help do
    title 'CringleMoney Bot'
    desc 'Converts Money and researches currency exchange rates.'

    command '<currency_1> to <currency_2, currency_3, ..>' do
      desc 'Gives you exchange rates from one currency into multiple others (comma separated).'
    end

    command '<amount currency> to <currency_2, currency_3, ..> ' do
      desc 'Exchanges a given amount for a given currency into multiple other currencies.'
    end
  end

  scan(/to/) do |client, data, match|
    call(client, data, match)
  end

  class << self
    def call(client, data, match)
      output = parse_input(data.text)
      client.say(channel: data.channel, text: output)
    end

    private

    def parse_input(match)
      from, to = match.split('to').strip
      amount, currency = from.scan(/\d+|\D+/)
      to = to.gsub(/[,\s]/, '').scan(/.{3}/)

      # get exchange rates: ["USD: 1.182452", "AUD: 1.555988"]
      if currency.nil?
        result = CringleMoney.get_rates(Money::Currency.wrap(amount), to)
        result.map { |c, a| [c, a].join(': ') }
      # exchange money: ["23.54 USD", "31.28 AUD"]
      else
        result = CringleMoney.new(amount, currency).exchange_to(to)
        result.map{ |m| [(m.fractional.to_f / m.currency.subunit_to_unit), m.currency.iso_code].join(' ') }
      end
      result.join(' | ')
    end
  end
end

CringleMoneyBot.run
