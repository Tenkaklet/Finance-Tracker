class Stock < ApplicationRecord

  def self.new_form_lookup(ticker_symbol)
    begin
      lookup_up_stock = StockQuote::Stock.quote(ticker_symbol)
      price = lookup_up_stock.latest_price
      new(name: lookup_up_stock.company_name, ticker: lookup_up_stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end
end
