json.array!(@bounties) do |bounty|
  json.extract! bounty, :id, :expiration, :amount, :currency, :poster
  json.url bounty_url(bounty, format: :json)
end
