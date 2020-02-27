json.extract! cashout, :id, :user_id, :amount, :paid, :created_at, :updated_at
json.url cashout_url(cashout, format: :json)
