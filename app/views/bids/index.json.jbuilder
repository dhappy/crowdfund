json.array!(@bids) do |bid|
  json.extract! bid, :id, :time, :bidder, :amount, :issue
  json.url bid_url(bid, format: :json)
end
