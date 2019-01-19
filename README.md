# Bytom SDK for Ruby

This page will document the API classes and ways to properly use the API. Subsequent new releases also maintain backward compatibility with this class approach. For more information, please see Bytom API reference documentation at [Bytom wiki](https://github.com/Bytom/bytom/wiki/API-Reference)

## System Requirements

The SDK supports Ruby versions 2.3.0 or later.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bytom', '>= 1.0.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bytom

## Example Usage

### Initialize the client

```ruby
require "bytom"

# for local node
bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888') 
# for remoate node
bytom_client = Bytom::Client.new(base_url: 'xxx', token: 'xxx')  
```

### Create a key

```ruby
key_data = bytom_client.keys.create_key(
    alias_name: 'bitdayone001',
    password: '123456',
    language: 'en'
)
```

### Create an account

```ruby
account_data = bytom_client.accounts.create_account(
    root_xpubs: [key_data['data']['xpub']], 
    alias_name: 'bitdayone001_account_01',
    quorum: 1
)
```

### Create an account receiver

```ruby
account_receiver_data = bytom_client.accounts.create_account_receiver(
    account_id: account_data['data']['id'],
    account_alias: account_data['data']['alias']
)
```

### Create an asset

```ruby
asset_data = bytom_client.asset.create_asset(
    alias_name: 'PropertyAsset',
    root_xpubs: [key_data['data']['xpub']],
    quorum: 1
)
```

### Issue asset

#### Firstly build the transaction

```ruby
actions = [
    {
        account_id: account_data['data']['id'],
        amount: 20000000, # fee, unit: neu. 1 BTM = 1000 mBTM = 100000000 neu
        asset_id: "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
        type: "spend_account"
    },
    {
        amount: 100000,
        asset_id: asset_data['data']['id'],
        type: "issue"
    },  # input action
    {
        amount: 100000,
        asset_id: asset_data['data']['id'],
        address: account_receiver_data['data']['address'],
        type: "control_address"
    } # output action
]
build_transaction_data = bytom_client.transactions.build_transaction(
    base_transaction: nil,
    ttl: 0,
    time_range: 129829,
    actions: actions
)
```

#### Secondly sign the transaction

```ruby
transaction = {
    allow_additional_actions: false,
    local: true,
    raw_transaction: build_transaction_data['data']['raw_transaction'],
    signing_instructions: build_transaction_data['data']['signing_instructions']
}
sign_transaction_data = bytom_client.transactions.sign_transaction(
    password: '123456',
    transaction: transaction
)
```

#### Finally submit the transaction

```ruby
bytom_client.transactions.submit_transaction(
    raw_transaction: sign_transaction_data['data']['transaction']['raw_transaction']
)

# reponse data if success
{"status"=>"success", "data"=>{"tx_id"=>"77045241ea94ceee617f12b698a4bdef84cd6e16a58f3191b08fe092f247834d"}}
```

## All API usage examples

All api usage examples you can see [doc](https://github.com/bitdayone/bytom-ruby-sdk/master/API-Reference.md). 

## Support and Feedback

If you find a bug, please submit the issue in Github directly by using [Issues](https://github.com/bitdayone/bytom-ruby-sdk/issues)

## License

Bytom Ruby SDK is based on the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt) protocol.