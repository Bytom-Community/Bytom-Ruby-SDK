



## Bytom SDK for Ruby

## Basic Usage

First, you need to initialize the client.
```ruby
# Local node 
bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')

# Remote node
bytom_client = Bytom::Client.new(base_url: 'xxx', token: 'xxx')

```

## API methods

### available with wallet enable

* [`create-key`](#create-key)
* [`list-keys`](#list-keys)
* [`update-key-alias`](#update-key-alias)
* [`delete-key`](#delete-key)
* [`check-key-password`](#check-key-password)
* [`reset-key-password`](#reset-key-password)
* [`create-account`](#create-account)
* [`list-accounts`](#list-accounts)
* [`update-account-alias`](#update-account-alias)
* [`delete-account`](#delete-account)
* [`create-account-receiver`](#create-account-receiver)
* [`list-addresses`](#list-addresses)
* [`validate-address`](#validate-address)
* [`get-mining-address`](#get-mining-address)
* [`set-mining-address`](#set-mining-address)
* [`get-coinbase-arbitrary`](#get-coinbase-arbitrary)
* [`set-coinbase-arbitrary`](#set-coinbase-arbitrary)
* [`list-pubkeys`](#list-pubkeys)
* [`create-asset`](#create-asset)
* [`get-asset`](#get-asset)
* [`list-assets`](#list-assets)
* [`update-asset-alias`](#update-asset-alias)
* [`list-balances`](#list-balances)
* [`list-unspent-outputs`](#list-unspent-outputs)
* [`backup-wallet`](#backup-wallet)
* [`restore-wallet`](#restore-wallet)
* [`rescan-wallet`](#rescan-wallet)
* [`recovery-wallet`](#recovery-wallet)
* [`wallet-info`](#wallet-info)
* [`sign-message`](#sign-message)
* [`decode-program`](#decode-program)
* [`get-transaction`](#get-transaction)
* [`list-transactions`](#list-transactions)
* [`build-transaction`](#build-transaction)
* [`build-chain-transactions`](#build-chain-transactions)
* [`sign-transaction`](#sign-transaction)
* [`sign-transactions`](#sign-transactions)

### available Whether or not the wallet is open

* [`submit-transaction`](#submit-transaction)
* [`submit-transactions`](#submit-transactions)
* [`estimate-transaction-gas`](#estimate-transaction-gas)
* [`create-access-token`](#create-access-token)
* [`list-access-tokens`](#list-access-tokens)
* [`delete-access-token`](#delete-access-token)
* [`check-access-token`](#check-access-token)
* [`create-transaction-feed`](#create-transaction-feed)
* [`get-transaction-feed`](#get-transaction-feed)
* [`list-transaction-feeds`](#list-transaction-feeds)
* [`delete-transaction-feed`](#delete-transaction-feed)
* [`update-transaction-feed`](#update-transaction-feed)
* [`get-unconfirmed-transaction`](#get-unconfirmed-transaction)
* [`list-unconfirmed-transactions`](#list-unconfirmed-transactions)
* [`decode-raw-transaction`](#decode-raw-transaction)
* [`get-block-count`](#get-block-count)
* [`get-block-hash`](#get-block-hash)
* [`get-block`](#get-block)
* [`get-block-header`](#get-block-header)
* [`get-difficulty`](#get-difficulty)
* [`get-hash-rate`](#get-hash-rate)
* [`net-info`](#net-info)
* [`is-mining`](#is-mining)
* [`set-mining`](#set-mining)
* [`gas-rate`](#gas-rate)
* [`verify-message`](#verify-message)
* [`compile`](#compile)
* [`list-peers`](#list-peers)
* [`disconnect-peer`](#disconnect-peer)
* [`connect-peer`](#connect-peer)
* [`get-work`](#get-work)
* [`submit-work`](#submit-work)
* [`get-work-json`](#get-work-json)
* [`submit-work-json`](#submit-work-json)

----

#### `create-key`

It is to create private key essentially, returns the information of key. The private key is encrypted in the file and not visible to the user.

##### Parameters

`Object`:

- `String` - *alias*, name of the key.
- `String` - *password*, password of the key.
- `String` - *language*, mnemonic language of the key.

Optional:

- `String` - *mnemonic*, mnemonic of the key, create key by specified mnemonic.

##### Returns

`Object`:

- `String` - *alias*, name of the key.
- `String` - *xpub*, root pubkey of the key.
- `String` - *file*, path to the file of key.

Optional:

- `String` - *mnemonic*, mnemonic of the key, exist when the request mnemonic is null.

##### Example

create key by random pattern:

```ruby
bytom_client.keys.create_key(
    alias_name: 'dayone', 
    password: '123456', 
    language: 'en'
)

# Response example
{  
   "status"   =>"success",
   "data"   =>   {  
      "alias"      =>"dayone",
      "xpub"      =>"f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f",
      "file"      =>"/Path/to/Library/Application Support/Bytom/keystore/UTC--2019-01-16T11-34-36.239356000Z--7b900b8e-2b3c-4136-857b-ded76257c7c5",
      "mnemonic"      =>"knock rocket siren eye skate adapt spatial flight latin purse tuna lunar"
   }
}
```

create key by specified mnemonic:

```ruby
bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')
mnemonic = "please observe raw beauty blue sea believe then boat float beyond position"
bytom_client.keys.create_key(
    alias_name: 'dayone2', 
    password: '123456', 
    language: 'en', 
    mnemonic: mnemonic
 )

# Response example
{  
   "status"   =>"success",
   "data"   =>   {  
      "alias"      =>"dayone2",
      "xpub"      =>"7d23d604dc03913d6719fa0fa3b2d9978beef3b4a8c81d7770ec83d2335f7860e8f081009094679ef66381d6a3a4d08063bc48666cb41479924fd4a5b41bf8f9",
      "file"      =>"/Path/To/Library/Application Support/Bytom/keystore/UTC--2019-01-16T11-35-22.778202000Z--e01d4fc8-ac16-4ddd-a1b7-b6bf4df623c9",
      "mnemonic"      =>"trap column derive melody okay angle cousin brother smoke trend misery sugar"
   }
}
```



------

#### list-keys

Returns the list of all available keys.

##### Parameters

none

##### Returns

- `Array of Object`, keys owned by the client.
  - `Object`:
    - `String` - *alias*, name of the key.
    - `String` - *xpub*, pubkey of the key.

##### Example

```ruby
bytom_client.keys.list_keys

# Response data
[
  {
    "alias": "dayone",
    "xpub": "a7dae957c2d35b42efe7e6871cf5a75ebd2a0d0e51caffe767db42d3e6d69dbe211d1ca492ecf05908fe6fa625ad61b3253375ea744c9442dd5551613ba50aea",
    "file": "/Path/To/Library/Bytom/keystore/UTC--2018-04-21T02-35-15.035935116Z--4f2b8bd7-0576-4b82-8941-6cc6da05efe3"
  },
  {
    "alias": "dayone2",
    "xpub": "d30a810e88532f73816b7b5007d413cbd21e526ae9159023e5262511893adc1526b8eacd691b27c080201d7d79336a4f3d2cb4c167d997821cad445765916254",
    "file": "/Path/To/Library/Bytom/keystore/UTC--2018-04-22T06-30-27.609315219Z--0e34293c-8856-4f5f-b934-37456a3820fa"
  }
]
```

----

#### `update-key-alias`

Update alias for the existed key.

##### Parameters

`Object`:

- `String` - *xpub*, pubkey of the key.
- `String` - *new_alias*, new alias of the key.

##### Returns

none if the key alias is updated successfully.

##### Example

```ruby
xpub = 'f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f'
bytom_client.keys.update_key_alias(xpub: xpub, new_alias: 'BitDayOne')

```

----

#### `delete-key`

Delete existed key, please make sure that there is no balance in the related accounts.

##### Parameters

`Object`:

- `String` - *xpub*, pubkey of the key.
- `String` - *password*, password of the key.

##### Returns

none if the key is deleted successfully.

##### Example

```ruby
xpub = 'f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f'
bytom_client.keys.delete_key(xpub: xpub, password: '123456')
```

----

#### `check-key-password`

Check key password.

##### Parameters

`Object`:

- `String` - *xpub*, pubkey of the key.
- `String` - *password*, password of the key.

##### Returns

`Object`:

- `Boolean` - *check_result*, result of check key password, true is check successfully, otherwise is false.

##### Example

```ruby
xpub = 'f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f'
bytom_client.keys.check_key_password(xpub: xpub,password: '123456')
# Response data
{"status"=>"success", "data"=>{"check_result"=>true}}
```

----

#### `reset-key-password`

Reset key password.

##### Parameters

`Object`:

- `String` - *xpub*, pubkey of the key.
- `String` - *old_password*, old password of the key.
- `String` - *new_password*, new password of the key.

##### Returns

`Object`:

- `Boolean` - *changed*, result of reset key password, true is reset successfully, otherwise is false.

##### Example

```ruby
xpub = 'f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f'
bytom_client.keys.reset_key_password(xpub: xpub, old_password: '123456', new_password: '12345678')

# Response data
{"status"=>"success", "data"=>{"changed"=>true}}
```

----

#### `create-account`

Create account to manage addresses. single sign account contain only one root_xpubs and quorum; however multi sign account contain many number of root_xpubs and quorum, quorum is the number of verify signature, the range is [1, len(root_xpubs)].

##### Parameters

`Object`:

- `Array of String` - *root_xpubs*, pubkey array.
- `String` - *alias*, name of the account.
- `Integer` - *quorum*, the default value is `1`, threshold of keys that must sign a transaction to spend asset units controlled by the account.

Optional:

- `String` - *access_token*, if optional when creating account locally. However, if you want to create account remotely, it's indispensable.

##### Returns

`Object`:

- `String` - *id*, account id.
- `String` - *alias*, name of account.
- `Integer` - *key_index*, key index of account.
- `Integer` - *quorom*, threshold of keys that must sign a transaction to spend asset units controlled by the account.
- `Array of Object` - *xpubs*, pubkey array.

##### Example

```ruby
root_xpubs = ['f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f']
bytom_client.accounts.create_account(
    root_xpubs: root_xpubs, 
    alias_name: 'dayone_account_001', 
    quorum: 1
)

# Response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "id"      =>"0NO14DLP00A02",
      "alias"      =>"dayone_account_001",
      "xpubs"      =>      [  
         "f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f"
      ],
      "quorum"      =>1,
      "key_index"      =>1,
      "derive_rule"      =>1
   }
}
```

----

#### `list-accounts`

Returns the list of all available accounts.

##### Parameters

Optional:

- `String` - *id*, account id.
- `String` - *alias*, name of account.

##### Returns

- `Array of Object`, account array.
  - `Object`:
    - `String` - *id*, account id.
    - `String` - *alias*, name of account.
    - `Integer` - *key_index*, key index of account.
    - `Integer` - *quorom*, threshold of keys that must sign a transaction to spend asset units controlled by the account.
    - `Array of Object` - *xpubs*, pubkey array.

##### Example

list all the available accounts:

```js
# Usage 1
bytom_client.accounts.list_accounts
# Usage 2
bytom_client.accounts.list_accounts(id: "0NO155F1G0A0A")
# Usage 3
bytom_client.accounts.list_accounts(alias_name:"dayone_account_005")

// Result
{
    "status" = >"success",
    "data" = >[{
        "id" = >"0NMKVC90G0A02",
        "alias" = >"test",
        "xpubs" = >["c8d4487f0fc13287235262ec5005a7519e5d376c66900bf4c58dd2e1827ce5224fd228e5b64bbd5c66c6d5cf69226cb1e7c83ba0d4f11eed8c429dc33fd1d95c"],
        "quorum" = >1,
        "key_index" = >1,
        "derive_rule" = >1
    }]
}
```

----

#### `update-account-alias`

Update alias for the existed account.

##### Parameters

`Object`: account_alias | account_id

- `String` - *new_alias*, new alias of account.

optional:

- `String` - *account_alias*, alias of account.
- `String` - *account_id*, id of account.


##### Returns

none if the account alias is updated successfully.

##### Example

```ruby
# update by account_id
bytom_client.accounts.update_account_alias_by_id(
    account_id: "0NO155F1G0A0A",  
    new_alias: 'new_dayone_account_005'
)
# update by account_alias
bytom_client.accounts.update_account_alias_by_alias(
    account_alias: "new_dayone_account_005",  
    new_alias: 'new_dayone_account_005_re'
)

```

----

#### `delete-account`

Delete existed account, please make sure that there is no balance in the related addresses.

##### Parameters

`Object`: account_alias | account_id

optional:

- `String` - *account_alias*, alias of account.
- `String` - *account_id*, id of account.

##### Returns

none if the account is deleted successfully.

##### Example

```ruby
# delete account by id
bytom_client.accounts.delete_account_by_id(account_id: "0NO155F1G0A0A")
# detelte account by alias name
bytom_client.accounts.delete_account_by_alias(account_alias: 'dayone_account_004')

```

----

#### `create-account-receiver`

create address and control program, the address and control program is are one to one relationship. in build-transaction API, receiver is address when action type is control_address, and receiver is control program when action type is control_program, they are the same result.

##### Parameters

`Object`: account_alias | account_id

optional:

- `String` - *account_alias*, alias of account.
- `String` - *account_id*, id of account.

##### Returns

`Object`:

- `String` - *address*, address of account.
- `String` - *control_program*, control program of account.

##### Example

```ruby
// Usage 1
bytom_client.accounts.create_account_receiver(account_id: '0NO14DLP00A02')
// Usage 2
bytom_client.accounts.create_account_receiver(account_alias: 'dayone_account_001')
// Usage 3
bytom_client.accounts.create_account_receiver(account_id: '0NO14DLP00A02', account_alias: 'dayone_account_001')

# Response data
{
    "status"=>"success", 
    "data"=>{
        "control_program"=>"00145b0c433fd9d2868742d268a1922ea99b7295ef4c", 						"address"=>"tm1qtvxyx07e62rgwskjdzseyt4fndeftm6vmxa8k4"
    }
 }
```
----

#### `list-addresses`

Returns the sub list of all available addresses by account.

##### Parameters

- `String`  - *account_alias*, alias of account.
- `String`  - *account_id*, id of account.
- `Integer` - *from*, the start position of first address
- `Integer` - *count*, the number of returned

##### Returns

- `Array of Object`, account address array.
  - `Object`:
    - `String` - *account_alias*, alias of account.
    - `String` - *account_id*, id of account.
    - `String` - *address*, address of account.
    - `Boolean` - *change*, whether the account address is change.

##### Example

list three addresses from first position by account_id or account_alias:

```ruby
bytom_client.address.list_addresses(
    account_alias: 'dayone_account_001',
    account_id: '0NO14DLP00A02',
    from: 0,
    count: 3
)

# Response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "account_alias"         =>"dayone_account_001",
         "account_id"         =>"0NO14DLP00A02",
         "address"         =>"tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz",
         "control_program"         =>"001453d0b795fbc245ec4dfc1a34d22959c455e6e619",
         "change"         =>false,
         "key_index"         =>1
      },
      {  
         "account_alias"         =>"dayone_account_001",
         "account_id"         =>"0NO14DLP00A02",
         "address"         =>"tm1qlhr257v5y03j6gxw4z9wqqnteglv2xdf6jcc02",
         "control_program"         =>"0014fdc6aa799423e32d20cea88ae0026bca3ec519a9",
         "change"         =>false,
         "key_index"         =>2
      },
      {  
         "account_alias"         =>"dayone_account_001",
         "account_id"         =>"0NO14DLP00A02",
         "address"         =>"tm1q3qtu353ts3ct3ny53mrp07ye9c8qd2ljk9rexm",
         "control_program"         =>"00148817c8d22b8470b8cc948ec617f8992e0e06abf2",
         "change"         =>false,
         "key_index"         =>3
      }
   ]
}
```

----

#### `validate-address`

Verify the address is valid, and judge the address is own.

##### Parameters

`Object`:

- `string` - *address*, address of account.

##### Returns

`Object`:

- `Boolean` - *valid*, whether the account address is valid.
- `Boolean` - *is_local*, whether the account address is local.

##### Example

check whether the address is valid or not.

```ruby
bytom_client.address.validate_address(
    address: 'tm1q3qtu353ts3ct3ny53mrp07ye9c8qd2ljk9rexm'
)

# Response data
{
    "status" = >"success",
    "data" = >{
        "valid" = >true,
        "is_local" = >true
    }
}
```

----

#### `get-mining-address`

Query the current mining address.

##### Parameters

none

##### Returns

`Object`:

- `String` - *mining_address*, the current mining address being used.

##### Example

```ruby
bytom_client.address.get_mining_address
# Response data
{
    "status" = >"success",
    "data" = >{
        "mining_address" = >"tm1qwq7xrl2mkta0eyp3y877y6p8ceqd3gzt4sn7lx"
    }
}
```

----

#### `set-mining-address`

Set the current mining address, no matter whethere the address is a local one. It returns an error message if the address format is incorrect.

##### Parameters

`Object`:

- `String` - *mining_address*, mining address to set.

##### Returns

`Object`:

- `String` - *mining_address*, the new mining address.

##### Example

```ruby
bytom_client.address.set_mining_address(
	mining_address: 'tm1q3qtu353ts3ct3ny53mrp07ye9c8qd2ljk9rexm'
)

# Response data
{
    "status" = >"success",
    "data" = >{
        "mining_address" = >"tm1q8q2594zptqz4mjhdvvmww4m5yau3tl7r8gnhp9"
    }
}
```

----

#### `get-coinbase-arbitrary`

Get coinbase arbitrary.

##### Parameters

none

##### Returns

`Object`:

- `String` - *arbitrary*, the abitrary data append to coinbase, in hexdecimal format. (The full coinbase data for a block will be `0x00`&block_height&abitrary.)

##### Example

```ruby
bytom_client.coinbase.get_coinbase_arbitrary
# Response data
{"status"=>"success", "data"=>{"arbitrary"=>"ff"}}
```

----

#### `set-coinbase-arbitrary`

Set coinbase arbitrary.

##### Parameters

`Object`:

- `String` - *arbitrary*, the abitrary data to be appended to coinbase, in hexdecimal format.

##### Returns

`Object`:

- `String` - *arbitrary*, the abitrary data being appended to coinbase, in hexdecimal format. (The full coinbase data for a block will be `0x00`&block_height&abitrary.)

##### Example

```ruby
bytom_client.coinbase.set_coinbase_arbitrary(arbitrary: 'ff')
# Response data
{"status"=>"success", "data"=>{"arbitrary"=>"ff"}}
```

----

#### `list-pubkeys`

Returns the list of all available pubkeys by account.

##### Parameters

`Object`: account_alias | account_id

optional:

- `String` - *account_alias*, alias of account.
- `String` - *account_id*, id of account.
- `string` - *public_key*, public key.

##### Returns

`Object`:

- `string` - *root_xpub*, root xpub.
- `Array of Object` -*pubkey_infos*, public key array.
  - `String` - *pubkey*, public key.
  - `Object` - *derivation_path*, derivated path for root xpub.

##### Example

```ruby
bytom_client.keys.list_pubkeys(account_id: '0NO14DLP00A02')
bytom_client.keys.list_pubkeys(account_alias: 'dayone_account_001')

# Response data
{
    "status" = >"success",
    "data" = >{
        "root_xpub" = >"c8d4487f0fc13287235262ec5005a7519e5d376c66900bf4c58dd2e1827ce5224fd228e5b64bbd5c66c6d5cf69226cb1e7c83ba0d4f11eed8c429dc33fd1d95c",
        "pubkey_infos" = >[{
            "pubkey" = >"6444be58a4c48a182d6e54fbf10abec0b311f670e779c7374ee24abe9e803ca7",
            "derivation_path" = >["2c000000", "99000000", "02000000", "00000000", "01000000"]
        },
        {
            "pubkey" = >"ce21fac4ab032efccecc3f6e1408472a46e025bfa21234b96d49db3522245482",
            "derivation_path" = >["2c000000", "99000000", "02000000", "00000000", "02000000"]
        },
        {
            "pubkey" = >"e55a4aad4cc3acc4968bbb48758533b6fb87fa16c377cd9562d142ebbd9cdea6",
            "derivation_path" = >["2c000000", "99000000", "02000000", "00000000", "03000000"]
        }]
    }
}

```

----

#### `create-asset`

Create asset definition, it prepares for the issuance of asset.

##### Parameters

`Object`:

- `String` - *alias*, name of the asset.
- `Object` - *definition*, definition of asset.

Optional:(please pick one form the following two ways)

- `Array of String` - *root_xpubs*, xpub array.
- `Integer` - *quorum*, the default value is `1`, threshold of keys that must sign a transaction to spend asset units controlled by the account.

or

- `String` - *issuance_program*, user-defined contract program.

##### Returns

`Object`:

- `String` - *id*, asset id.
- `String` - *alias*, name of the asset.
- `String` - *issuance_program*, control program of the issuance of asset.
- `Array of Object` - *keys*, information of asset pubkey.
- `String` - *definition*, definition of asset.
- `Integer` - *quorum*, threshold of keys that must sign a transaction to spend asset units controlled by the account.

##### Example

create asset by xpubs:

```ruby
# create asset by xpubs:
bytom_client.asset.create_asset(
   alias_name: 'Property01',
   root_xpubs: ['f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f'],
   quorum: 1  
)
# Response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "id"      =>"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
      "alias"      =>"PROPERTY01",
      "issuance_program"      =>"ae204c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48885151ad",
      "keys"      =>      [  
         {  
            "root_xpub"            =>"f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f",
            "asset_pubkey"            =>"4c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48881c21cf8627fbe7063b0acaa760dd4cd310c2b5dd39244ab21d92ea3a5c273d7f",
            "asset_derivation_path"            =>            [  
               "000300000000000000"
            ]
         }
      ],
      "quorum"      =>1,
      "definition"      =>      {  

      }
   }
}

```

create asset by issuance_program:

```ruby
# create asset by issuance_program:
bytom_client.asset.create_asset(
   alias_name: 'TESTASSET1',
   issuance_program: '20e9108d3ca8049800727f6a3505b3a2710dc579405dde03c250f16d9a7e1e6e78160014c5a5b563c4623018557fb299259542b8739f6bc20163201e074b22ed7ae8470c7ba5d8a7bc95e83431a753a17465e8673af68a82500c22741a547a6413000000007b7b51547ac1631a000000547a547aae7cac0090',
    definition: {
    	name: "TESTASSET1",
       	symbol: "TESTASSET1",
        decimals: 8,
        description: {} 
    }
)

# Response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "id"      =>"8ce2e19c1677261b0777619490b8e67311ae2cac7c5bd943e269f9d78f809dcb",
      "alias"      =>"TESTASSET1",
      "issuance_program"      =>"20e9108d3ca8049800727f6a3505b3a2710dc579405dde03c250f16d9a7e1e6e78160014c5a5b563c4623018557fb299259542b8739f6bc20163201e074b22ed7ae8470c7ba5d8a7bc95e83431a753a17465e8673af68a82500c22741a547a6413000000007b7b51547ac1631a000000547a547aae7cac0090",
      "keys"      =>nil,
      "quorum"      =>0,
      "definition"      =>      {  
         "decimals"         =>8,
         "description"         =>         {  

         },
         "name"         =>"TESTASSET1",
         "symbol"         =>"TESTASSET1"
      }
   }
}

```

----

#### `get-asset`

Query detail asset by asset ID.

##### Parameters

`Object`:

- `String` - *id*, id of asset.

##### Returns

`Object`:

- `String` - *id*, asset id.
- `String` - *alias*, name of the asset.
- `String` - *issuance_program*, control program of the issuance of asset.
- `Integer` - *key_index*, index of key for xpub.
- `Integer` - *quorum*, threshold of keys that must sign a transaction to spend asset units controlled by the account.
- `Array of Object` - *xpubs*, pubkey array.
- `String` - *type*, type of asset.
- `Integer` - *vm_version*, version of VM.
- `String` - *raw_definition_byte*, byte of asset definition.
- `Object` - *definition*, description of asset.

##### Example

get asset by assetID.

```ruby
bytom_client.asset.get_asset(
    id: '41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622'
)

# Response data 
{  
   "status"   =>"success",
   "data"   =>   {  
      "type"      =>"asset",
      "xpubs"      =>      [  
         "f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f"
      ],
      "quorum"      =>1,
      "key_index"      =>3,
      "derive_rule"      =>0,
      "id"      =>"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
      "alias"      =>"PROPERTY01",
      "vm_version"      =>1,
      "issue_program"      =>"ae204c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48885151ad",
      "raw_definition_byte"      =>"7b7d",
      "definition"      =>      {  

      }
   }
}
```

----

#### `list-assets`

Returns the list of all available assets.

##### Parameters

none

##### Returns

- `Array of Object`, asset array.
  - `Object`:
    - `String` - *id*, asset id.
    - `String` - *alias*, name of the asset.
    - `String` - *issuance_program*, control program of the issuance of asset.
    - `Integer` - *key_index*, index of key for xpub.
    - `Integer` - *quorum*, threshold of keys that must sign a transaction to spend asset units controlled by the account.
    - `Array of Object` - *xpubs*, pubkey array.
    - `String` - *type*, type of asset.
    - `Integer` - *vm_version*, version of VM.
    - `String` - *raw_definition_byte*, byte of asset definition.
    - `Object` - *definition*, description of asset.

##### Example

list all the available assets:

```js
bytom_client.asset.list_assets

# Response data
{
    "status" = >"success",
    "data" = >[{
        "type" = >"internal",
        "xpubs" = >nil,
        "quorum" = >0,
        "key_index" = >0,
        "derive_rule" = >0,
        "id" = >"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
        "alias" = >"BTM",
        "vm_version" = >1,
        "issue_program" = >"",
        "raw_definition_byte" = >"7b0a202022646563696d616c73223a20382c0a2020226465736372697074696f6e223a20224279746f6d204f6666696369616c204973737565222c0a2020226e616d65223a202242544d222c0a20202273796d626f6c223a202242544d220a7d",
        "definition" = >{
            "decimals" = >8,
            "description" = >"Bytom Official Issue",
            "name" = >"BTM",
            "symbol" = >"BTM"
        }
    },
    {
        "id" = >"0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5",
        "alias" = >"TESTASSET",
        "vm_version" = >1,
        "issue_program" = >"20e9108d3ca8049800727f6a3505b3a2710dc579405dde03c250f16d9a7e1e6e78160014c5a5b563c4623018557fb299259542b8739f6bc20163201e074b22ed7ae8470c7ba5d8a7bc95e83431a753a17465e8673af68a82500c22741a547a6413000000007b7b51547ac1631a000000547a547aae7cac00c0",
        "raw_definition_byte" = >"7b0a202022646563696d616c73223a20382c0a2020226465736372697074696f6e223a207b7d2c0a2020226e616d65223a2022544553544153534554222c0a20202273796d626f6c223a2022544553544153534554220a7d",
        "definition" = >{
            "decimals" = >8,
            "description" = >{},
            "name" = >"TESTASSET",
            "symbol" = >"TESTASSET"
        }
    },
    {
        "type" = >"asset",
        "xpubs" = >["c8d4487f0fc13287235262ec5005a7519e5d376c66900bf4c58dd2e1827ce5224fd228e5b64bbd5c66c6d5cf69226cb1e7c83ba0d4f11eed8c429dc33fd1d95c"],
        "quorum" = >1,
        "key_index" = >1,
        "derive_rule" = >0,
        "id" = >"e3e940fd9026a619ebb3c3dd1a1f0fc846cd57d2b33c55005605c1405135d2ef",
        "alias" = >"GOLD",
        "vm_version" = >1,
        "issue_program" = >"ae20334dfa534262c970ebf9e43e9573c7fbc4ecc6ce2db77204b63e1a277a7eae175151ad",
        "raw_definition_byte" = >"7b7d",
        "definition" = >nil
    }]
}
```

----

#### `update-asset-alias`

Update asset alias by assetID.

##### Parameters

`Object`:

- `String` - *id*, id of asset.
- `String` - *alias*, new alias of asset.

##### Returns

none if the asset alias is updated success.

##### Example

update asset alias.

```js
bytom_client.asset.update_asset_alias(
    id: '41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622',
    alias_name: 'Property'
)

# Response data
```

----

#### `list-balances`

Returns the list of all available account balances.

##### Parameters

Optional:

- `String` - *account_id*, account id.
- `String` - *account_alias*, name of account.

##### Returns

- `Array of Object`, balances owned by the account.
  - `Object`:
    - `String` - *account_id*, account id.
    - `String` - *account_alias*, name of account.
    - `String` - *asset_id*, asset id.
    - `String` - *asset_alias*, name of asset.
    - `Integer` - *amount*, specified asset balance of account.

##### Example

list all the available account balances.

```ruby
#bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')
bytom_client.balances.list_balances

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "account_id"         =>"0NO14DLP00A02",
         "account_alias"         =>"dayone_account_001",
         "asset_alias"         =>"BTM",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "amount"         =>1000000000,
         "asset_definition"         =>         {  
            "decimals"            =>8,
            "description"            =>"Bytom Official Issue",
            "name"            =>"BTM",
            "symbol"            =>"BTM"
         }
      },
      {  
         "account_id"         =>"0NO14VPOG0A04",
         "account_alias"         =>"dayone_account_002",
         "asset_alias"         =>"BTM",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "amount"         =>2000000000,
         "asset_definition"         =>         {  
            "decimals"            =>8,
            "description"            =>"Bytom Official Issue",
            "name"            =>"BTM",
            "symbol"            =>"BTM"
         }
      }
   ]
}
```

list available account balances by the given account_id:

```ruby
bytom_client.balances.list_balances(account_id: '0NO14VPOG0A04')
bytom_client.balances.list_balances(account_alias: 'dayone_account_002')
# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "account_id"         =>"0NO14VPOG0A04",
         "account_alias"         =>"dayone_account_002",
         "asset_alias"         =>"BTM",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "amount"         =>2000000000,
         "asset_definition"         =>         {  
            "decimals"            =>8,
            "description"            =>"Bytom Official Issue",
            "name"            =>"BTM",
            "symbol"            =>"BTM"
         }
      }
   ]
}
```

----

#### `list-unspent-outputs`

Returns the sub list of all available unspent outputs for all accounts in your wallet.

##### Parameters

`Object`:

optional:

- `String` - *id*, id of unspent output.
- `Boolean` - *unconfirmed*, is include unconfirmed utxo
- `Boolean` - *smart_contract*, is contract utxo
- `Integer` - *from*, the start position of first utxo
- `Integer` - *count*, the number of returned
- `String` - *account_id*, account id.
- `String` - *account_alias*, name of account.

##### Returns

- `Array of Object`, unspent output array.
  - `Object`:
    - `String` - *account_id*, account id.
    - `String` - *account_alias*, name of account.
    - `String` - *asset_id*, asset id.
    - `String` - *asset_alias*, name of asset.
    - `Integer` - *amount*, specified asset balance of account.
    - `String` - *address*, address of account.
    - `Boolean` - *change*, whether the account address is change.
    - `String` - *id*, unspent output id.
    - `String` - *program*, program of account.
    - `String` - *control_program_index*, index of program.
    - `String` - *source_id*, source unspent output id.
    - `String` - *source_pos*, position of source unspent output id in block.
    - `String` - *valid_height*, valid height.

##### Example

list all the available unspent outputs:

```ruby
bytom_client.other.list_unspent_outputs

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "account_alias"         =>"dayone_account_001",
         "id"         =>"d49567a31855a8d83ce13e3d2169d753c7d117cb97739744d34a976b1ee6cdae",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "asset_alias"         =>"BTM",
         "amount"         =>1000000000,
         "account_id"         =>"0NO14DLP00A02",
         "address"         =>"tm1qlhr257v5y03j6gxw4z9wqqnteglv2xdf6jcc02",
         "control_program_index"         =>2,
         "program"         =>"0014fdc6aa799423e32d20cea88ae0026bca3ec519a9",
         "source_id"         =>"5835d2a35141e44415bfb2277e0ba370cd43336931cfa31eff23db31ccd45394",
         "source_pos"         =>1,
         "valid_height"         =>0,
         "change"         =>false,
         "derive_rule"         =>0
      },
      {  
         "account_alias"         =>"dayone_account_002",
         "id"         =>"240eb6ee1aa3583779eb0af6b450aeacd42c1375d914f8442f28cfd71f11f265",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "asset_alias"         =>"BTM",
         "amount"         =>1000000000,
         "account_id"         =>"0NO14VPOG0A04",
         "address"         =>"tm1qgpw5p3t750jyapx8ecqjyvs5mkcr45h786ed32",
         "control_program_index"         =>1,
         "program"         =>"0014405d40c57ea3e44e84c7ce01223214ddb03ad2fe",
         "source_id"         =>"ea01e22daecbcb7dbebcbddca8a8c604e722f99acd9f938e303d944e66314a8f",
         "source_pos"         =>1,
         "valid_height"         =>0,
         "change"         =>false,
         "derive_rule"         =>0
      },
      {  
         "account_alias"         =>"dayone_account_002",
         "id"         =>"141d3c5447fc01f5dd2eac4567dc14295ada4cfedc59d6674d1564f5c4e9369c",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "asset_alias"         =>"BTM",
         "amount"         =>1000000000,
         "account_id"         =>"0NO14VPOG0A04",
         "address"         =>"tm1qgpw5p3t750jyapx8ecqjyvs5mkcr45h786ed32",
         "control_program_index"         =>1,
         "program"         =>"0014405d40c57ea3e44e84c7ce01223214ddb03ad2fe",
         "source_id"         =>"aec2b2b48d20eddb811584412ac79c78c8633d856016a2ec1f2ca9df1d4f363e",
         "source_pos"         =>1,
         "valid_height"         =>0,
         "change"         =>false,
         "derive_rule"         =>0
      }
   ]
}
```

list the unspent output matching the given id:

```ruby
bytom_client.other.list_unspent_outputs(
    id: '240eb6ee1aa3583779eb0af6b450aeacd42c1375d914f8442f28cfd71f11f265'
)
# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "account_alias"         =>"dayone_account_002",
         "id"         =>"240eb6ee1aa3583779eb0af6b450aeacd42c1375d914f8442f28cfd71f11f265",
         "asset_id"         =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         "asset_alias"         =>"BTM",
         "amount"         =>1000000000,
         "account_id"         =>"0NO14VPOG0A04",
         "address"         =>"tm1qgpw5p3t750jyapx8ecqjyvs5mkcr45h786ed32",
         "control_program_index"         =>1,
         "program"         =>"0014405d40c57ea3e44e84c7ce01223214ddb03ad2fe",
         "source_id"         =>"ea01e22daecbcb7dbebcbddca8a8c604e722f99acd9f938e303d944e66314a8f",
         "source_pos"         =>1,
         "valid_height"         =>0,
         "change"         =>false,
         "derive_rule"         =>0
      }
   ]
}
```

----

#### `backup-wallet`

Backup wallet to image file, it contain accounts image, assets image and keys image.

##### Parameters

none

##### Returns

`Object`:

- `Object` - *account_image*, account image.
- `Object` - *asset_image*, asset image.
- `Object` - *key_images*, key image.

##### Example

```ruby
bytom_client.wallet.backup_wallet

# return 
{  
   "status"   =>"success",
   "data"   =>   {  
      "account_image"      =>      {  
         "slices"         =>         [  ]
      },
      "asset_image"      =>      {  
         "assets"         =>         [  ]
      },
      "key_images"      =>      {  
         "xkeys"         =>         [  ]
      }
   }
}
```

----

#### `restore-wallet`

Restore wallet by image file.

##### Parameters

`Object`:

- `Object` - *account_image*, account image.
- `Object` - *asset_image*, asset image.
- `Object` - *key_images*, key image.

##### Returns

none if restore wallet success.

##### Example

```ruby

bytom_client.wallet.restore_wallet(
	account_image: {}, #'please input you data'
    asset_image: {},  #'please input you data'
    key_images: {}   #'please input you data'
)
```

----

#### `rescan-wallet`

Trigger to rescan block information into related wallet.

##### Parameters

none

##### Returns

none if restore wallet success.

##### Example

```ruby
bytom_client.wallet.rescan_wallet

```

----

#### `recovery-wallet`

Recovery wallet and accounts from root XPubs.
All accounts and balances of bip44 multi-account hierarchy for deterministic wallets can be restored via root xpubs.

##### Parameters

`Object`:

- `Object` - *xpubs*, root XPubs.


##### Returns

Status of recovery wallet.

##### Example

```
bytom_client.wallet.recovery_wallet(
	xpubs: ['d46c29a44c36553b950a7a7eada946258042065e4c594b548056e12bc4f010a4b617b9ed9f10c05cb02b6bdee82828f65d9f8e7746c2342d63da72e6c2ef3089']
)
```
----

#### `wallet-info`

Return the information of wallet.

##### Parameters

none

##### Returns

`Object`:

- `Integer` - *best_block_height*, current block height.
- `Integer` - *wallet_height*, current block height for wallet.

##### Example

```ruby
bytom_client.wallet.wallet_info

# Response data
{"status"=>"success", "data"=>{"best_block_height"=>119081, "wallet_height"=>119081}}
```

----

#### `sign-message`

Sign a message with the key password(decode encrypted private key) of an address.

##### Parameters

`Object`:

- `String` - *address*, address for account.
- `String` - *message*, message for signature by address xpub.
- `String` - *password*, password of account.

##### Returns

`Object`:

- `String` - *derived_xpub*, derived xpub.
- `String` - *signature*, signature of message.

##### Example

```ruby
bytom_client.message.sign_message(
	address: 'tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz',
    message: 'This is a new message',
    password: '123456'
)

# Request
curl -X POST http://127.0.0.1:9888/sign-message -d '{"address":"tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz", "message":"this is a test message", "password":"123456"}'

# Result
{
  "signature": "74da3d6572233736e3a439166719244dab57dd0047f8751b1efa2da26eeab251d915c1211dcad77e8b013267b86d96e91ae67ff0be520ef4ec326e911410b609",
  "derived_xpub": "6ff8c3d1321ce39a3c3550f57ba70b67dcbcef821e9b85f6150edb7f2f3f91009e67f3075e6e76ed5f657ee4b1a5f4749b7a8c74c8e7e6a1b0e5918ebd5df4d0"
}
```

----

#### `decode-program`

Decode program.

##### Parameters

`Object`:

- `String` - *program*, program for account.

##### Returns

`Object`:

- `String` - *instructions*, instructions and data for program.

##### Example

```ruby
bytom_client.other.decode_program(
	program: "0014a86c83ee12e6d790fb388345cc2e2b87056a0773"
)
# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "instructions"      =>"DUP \nHASH160 \nDATA_20 a86c83ee12e6d790fb388345cc2e2b87056a0773\nEQUALVERIFY \nTXSIGHASH \nSWAP \nCHECKSIG \n"
   }
}
```

----

#### `get-transaction`

Query the account related transaction by transaction ID.

##### Parameters

`Object`:

- `String` - *tx_id*, transaction id, hash of transaction.

##### Returns

`Object`:

- `String` - *tx_id*, transaction id, hash of the transaction.
- `Integer` - *block_time*, the unix timestamp for when the requst was responsed.
- `String` - *block_hash*, hash of the block where this transaction was in.
- `Integer` - *block_height*, block height where this transaction was in.
- `Integer` - *block_index*, position of the transaction in the block.
- `Integer` - *block_transactions_count*, transactions count where this transaction was in the block.
- `Boolean` - *status_fail*, whether the state of the transaction request has failed.
- `Integer` - *size*, size of transaction.
- `Array of Object` - *inputs*, object of inputs for the transaction.
  - `String` - *type*, the type of input action, available option include: 'spend', 'issue', 'coinbase'.
  - `String` - *asset_id*, asset id.
  - `String` - *asset_alias*, name of asset.
  - `Object` - *asset_definition*, definition of asset(json object).
  - `Integer` - *amount*, amount of asset.
  - `Object` - *issuance_program*, issuance program, it only exist when type is 'issue'.
  - `Object` - *control_program*, control program of account, it only exist when type is 'spend'.
  - `String` - *address*, address of account, it only exist when type is 'spend'.
  - `String` - *spent_output_id*, the front of outputID to be spent in this input, it only exist when type is 'spend'.
  - `String` - *account_id*, account id.
  - `String` - *account_alias*, name of account.
  - `Object` - *arbitrary*, arbitrary infomation can be set by miner, it only exist when type is 'coinbase'.
  - `String` - *input_id*, hash of input action.
  - `Array of String` - *witness_arguments*, witness arguments.
- `Array of Object` - *outputs*, object of outputs for the transaction.
  - `String` - *type*, the type of output action, available option include: 'retire', 'control'.
  - `String` - *id*, outputid related to utxo.
  - `Integer` - *position*, position of outputs.
  - `String` - *asset_id*, asset id.
  - `String` - *asset_alias*, name of asset.
  - `Object` - *asset_definition*, definition of asset(json object).
  - `Integer` - *amount*, amount of asset.
  - `String` - *account_id*, account id.
  - `String` - *account_alias*, name of account.
  - `Object` - *control_program*, control program of account.
  - `String` - *address*, address of account.

##### Example

```ruby
bytom_client.transactions.get_transaction(
	tx_id: 'bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266'
)

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "tx_id"      =>"bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266",
      "block_time"      =>1547715214,
      "block_hash"      =>"bb155a108fb769506bc33ffd756c5ac4f112b48d81701ce9306942abdaa76ecf",
      "block_height"      =>119228,
      "block_index"      =>1,
      "block_transactions_count"      =>2,
      "inputs"      =>      [  
         {  
            "type"            =>"spend",
            "asset_id"            =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            "asset_alias"            =>"BTM",
            "asset_definition"            =>            {  
               "decimals"               =>8,
               "description"               =>"Bytom Official Issue",
               "name"               =>"BTM",
               "symbol"               =>"BTM"
            },
            "amount"            =>35860000000,
            "control_program"            =>"0014ebd24bd4394a7b136e45e1787126344989389cd9",
            "address"            =>"tm1qa0fyh4peffa3xmj9u9u8zf35fxyn38xej27fls",
            "spent_output_id"            =>"2d0367b043e53d58a1bd266d6e73907c8abf6fe370cf38bb3b6674daf72c63cf",
            "input_id"            =>"3dc91ddccfeab72500a4b792ec52afcf5de62f650a22350986aca435ca1cb307",
            "witness_arguments"            =>            [  
               "be89ee618fc96a6b9722cbd6d1cf31a4fe7428ded1e7d494e187a5a3f0862eebed18423b7bc61c66be39e82656c8e43ac99556b2c7f610e9a9b3b01ed81e4c03",
               "a25abccb8332f3336069bf750128896c85aef777fbef3107276920d5727d2ff8"
            ]
         }
      ],
      "outputs"      =>      [  
         {  
            "type"            =>"control",
            "id"            =>"93e951305b8ed0a2500df0beec6f82e72853a4ab2edaed1fad18dce915eeb7bd",
            "position"            =>0,
            "asset_id"            =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            "asset_alias"            =>"BTM",
            "asset_definition"            =>            {  
               "decimals"               =>8,
               "description"               =>"Bytom Official Issue",
               "name"               =>"BTM",
               "symbol"               =>"BTM"
            },
            "amount"            =>34850000000,
            "control_program"            =>"0014f365d81eca39f8be2f7a39908fcc36b4005d6040",
            "address"            =>"tm1q7djas8k288ututm68xgglnpkksq96czqhpxttj"
         },
         {  
            "type"            =>"control",
            "id"            =>"240eb6ee1aa3583779eb0af6b450aeacd42c1375d914f8442f28cfd71f11f265",
            "position"            =>1,
            "asset_id"            =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            "asset_alias"            =>"BTM",
            "asset_definition"            =>            {  
               "decimals"               =>8,
               "description"               =>"Bytom Official Issue",
               "name"               =>"BTM",
               "symbol"               =>"BTM"
            },
            "amount"            =>1000000000,
            "account_id"            =>"0NO14VPOG0A04",
            "account_alias"            =>"dayone_account_002",
            "control_program"            =>"0014405d40c57ea3e44e84c7ce01223214ddb03ad2fe",
            "address"            =>"tm1qgpw5p3t750jyapx8ecqjyvs5mkcr45h786ed32"
         }
      ],
      "status_fail"      =>false,
      "size"      =>337
   }
}
```

----

#### `list-transactions`

Returns the sub list of all the account related transactions.

##### Parameters

`Object`:

optional:

- `String` - *id*, transaction id, hash of transaction.
- `String` - *account_id*, id of account.
- `Boolean` - *detail* , flag of detail transactions, default false (only return transaction summary)
- `Boolean` - *unconfirmed*, flag of unconfirmed transactions(query result include all confirmed and unconfirmed transactions), default false.
- `Integer` - *from*, the start position of first transaction
- `Integer` - *count*, the number of returned

##### Returns

`Array of Object`, transaction array.

optional:

  - `Object`:(summary transaction)
    - `String` - *tx_id*, transaction id, hash of the transaction.
    - `Integer` - *block_time*, the unix timestamp for when the requst was responsed.
    - `Array of Object` - *inputs*, object of summary inputs for the transaction.
      - `String` - *type*, the type of input action, available option include: 'spend', 'issue', 'coinbase'.
      - `String` - *asset_id*, asset id.
      - `String` - *asset_alias*, name of asset.
      - `Integer` - *amount*, amount of asset.
      - `String` - *account_id*, account id.
      - `String` - *account_alias*, name of account.
      - `Object` - *arbitrary*, arbitrary infomation can be set by miner, it only exist when type is 'coinbase'.
    - `Array of Object` - *outputs*, object of summary outputs for the transaction.
      - `String` - *type*, the type of output action, available option include: 'retire', 'control'.
      - `String` - *asset_id*, asset id.
      - `String` - *asset_alias*, name of asset.
      - `Integer` - *amount*, amount of asset.
      - `String` - *account_id*, account id.
      - `String` - *account_alias*, name of account.
      - `Object` - *arbitrary*, arbitrary infomation can be set by miner, it only exist when type is input 'coinbase'(this place is empty).

  - `Object`:(detail transaction)
    - `String` - *tx_id*, transaction id, hash of the transaction.
    - `Integer` - *block_time*, the unix timestamp for when the requst was responsed.
    - `String` - *block_hash*, hash of the block where this transaction was in.
    - `Integer` - *block_height*, block height where this transaction was in.
    - `Integer` - *block_index*, position of the transaction in the block.
    - `Integer` - *block_transactions_count*, transactions count where this transaction was in the block.
    - `Boolean` - *status_fail*, whether the state of the transaction request has failed.
    - `Integer` - *size*, size of transaction.
    - `Array of Object` - *inputs*, object of inputs for the transaction.
      - `String` - *type*, the type of input action, available option include: 'spend', 'issue', 'coinbase'.
      - `String` - *asset_id*, asset id.
      - `String` - *asset_alias*, name of asset.
      - `Object` - *asset_definition*, definition of asset(json object).
      - `Integer` - *amount*, amount of asset.
      - `Object` - *issuance_program*, issuance program, it only exist when type is 'issue'.
      - `Object` - *control_program*, control program of account, it only exist when type is 'spend'.
      - `String` - *address*, address of account, it only exist when type is 'spend'.
      - `String` - *spent_output_id*, the front of outputID to be spent in this input, it only exist when type is 'spend'.
      - `String` - *account_id*, account id.
      - `String` - *account_alias*, name of account.
      - `Object` - *arbitrary*, arbitrary infomation can be set by miner, it only exist when type is 'coinbase'.
      - `String` - *input_id*, hash of input action.
      - `Array of String` - *witness_arguments*, witness arguments.
    - `Array of Object` - *outputs*, object of outputs for the transaction.
      - `String` - *type*, the type of output action, available option include: 'retire', 'control'.
      - `String` - *id*, outputid related to utxo.
      - `Integer` - *position*, position of outputs.
      - `String` - *asset_id*, asset id.
      - `String` - *asset_alias*, name of asset.
      - `Object` - *asset_definition*, definition of asset(json object).
      - `Integer` - *amount*, amount of asset.
      - `String` - *account_id*, account id.
      - `String` - *account_alias*, name of account.
      - `Object` - *control_program*, control program of account.
      - `String` - *address*, address of account.

##### Example

list all the available transactions:

```ruby
#bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')
bytom_client.transactions.list_transactions

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "tx_id"         =>"bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266",
         "block_time"         =>1547715214,
         "inputs"         =>         [  
            {  
               "type"               =>"spend",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>35860000000
            }
         ],
         "outputs"         =>         [  
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>34850000000
            },
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>1000000000,
               "account_id"               =>"0NO14VPOG0A04",
               "account_alias"               =>"dayone_account_002"
            }
         ]
      },
      {  
         "tx_id"         =>"b9cfc401cba53c6a873c8df40cf68f474314495f73828c206606d803426c48b9",
         "block_time"         =>1547715091,
         "inputs"         =>         [  
            {  
               "type"               =>"spend",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>27780000000
            }
         ],
         "outputs"         =>         [  
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>26770000000
            },
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>1000000000,
               "account_id"               =>"0NO14VPOG0A04",
               "account_alias"               =>"dayone_account_002"
            }
         ]
      },
      {  
         "tx_id"         =>"be6a59fe11eb395358875ad4c1a1f01a52ca07367684bfdd8c21a0dcc5256299",
         "block_time"         =>1547715091,
         "inputs"         =>         [  
            {  
               "type"               =>"spend",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>4550000000
            }
         ],
         "outputs"         =>         [  
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>3540000000
            },
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>1000000000,
               "account_id"               =>"0NO14DLP00A02",
               "account_alias"               =>"dayone_account_001"
            }
         ]
      }
   ]
}
```

list the transaction matching the given tx_id with detail:

```ruby
bytom_client.transactions.list_transactions(
	id: 'bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266'
)

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "tx_id"         =>"bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266",
         "block_time"         =>1547715214,
         "inputs"         =>         [  
            {  
               "type"               =>"spend",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>35860000000
            }
         ],
         "outputs"         =>         [  
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>34850000000
            },
            {  
               "type"               =>"control",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "amount"               =>1000000000,
               "account_id"               =>"0NO14VPOG0A04",
               "account_alias"               =>"dayone_account_002"
            }
         ]
      }
   ]
}


bytom_client.transactions.list_transactions(
	id: 'bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266',
    detail: true
)

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "tx_id"         =>"bf48ce62e78466a40e26dd8497ffb6cd4a6064a2293c9a01ed57e3e1bb293266",
         "block_time"         =>1547715214,
         "block_hash"         =>"bb155a108fb769506bc33ffd756c5ac4f112b48d81701ce9306942abdaa76ecf",
         "block_height"         =>119228,
         "block_index"         =>1,
         "block_transactions_count"         =>2,
         "inputs"         =>         [  
            {  
               "type"               =>"spend",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "asset_definition"               =>               {  
                  "decimals"                  =>8,
                  "description"                  =>"Bytom Official Issue",
                  "name"                  =>"BTM",
                  "symbol"                  =>"BTM"
               },
               "amount"               =>35860000000,
               "control_program"               =>"0014ebd24bd4394a7b136e45e1787126344989389cd9",
               "address"               =>"tm1qa0fyh4peffa3xmj9u9u8zf35fxyn38xej27fls",
               "spent_output_id"               =>"2d0367b043e53d58a1bd266d6e73907c8abf6fe370cf38bb3b6674daf72c63cf",
               "input_id"               =>"3dc91ddccfeab72500a4b792ec52afcf5de62f650a22350986aca435ca1cb307",
               "witness_arguments"               =>               [  
                  "be89ee618fc96a6b9722cbd6d1cf31a4fe7428ded1e7d494e187a5a3f0862eebed18423b7bc61c66be39e82656c8e43ac99556b2c7f610e9a9b3b01ed81e4c03",
                  "a25abccb8332f3336069bf750128896c85aef777fbef3107276920d5727d2ff8"
               ]
            }
         ],
         "outputs"         =>         [  
            {  
               "type"               =>"control",
               "id"               =>"93e951305b8ed0a2500df0beec6f82e72853a4ab2edaed1fad18dce915eeb7bd",
               "position"               =>0,
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "asset_definition"               =>               {  
                  "decimals"                  =>8,
                  "description"                  =>"Bytom Official Issue",
                  "name"                  =>"BTM",
                  "symbol"                  =>"BTM"
               },
               "amount"               =>34850000000,
               "control_program"               =>"0014f365d81eca39f8be2f7a39908fcc36b4005d6040",
               "address"               =>"tm1q7djas8k288ututm68xgglnpkksq96czqhpxttj"
            },
            {  
               "type"               =>"control",
               "id"               =>"240eb6ee1aa3583779eb0af6b450aeacd42c1375d914f8442f28cfd71f11f265",
               "position"               =>1,
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "asset_definition"               =>               {  
                  "decimals"                  =>8,
                  "description"                  =>"Bytom Official Issue",
                  "name"                  =>"BTM",
                  "symbol"                  =>"BTM"
               },
               "amount"               =>1000000000,
               "account_id"               =>"0NO14VPOG0A04",
               "account_alias"               =>"dayone_account_002",
               "control_program"               =>"0014405d40c57ea3e44e84c7ce01223214ddb03ad2fe",
               "address"               =>"tm1qgpw5p3t750jyapx8ecqjyvs5mkcr45h786ed32"
            }
         ],
         "status_fail"         =>false,
         "size"         =>337
      }
   ]
}
```

list the transaction matching the given account_id and unconfirmed flag(unconfirmed transaction's block_hash, block_height and block_index is default for zero):

```ruby
bytom_client.transactions.list_transactions(
	account_id: '0NO14DLP00A02',
    unconfirmed: true,
    detail: true
)

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "tx_id"         =>"be6a59fe11eb395358875ad4c1a1f01a52ca07367684bfdd8c21a0dcc5256299",
         "block_time"         =>1547715091,
         "block_hash"         =>"d570b5a319ea26b20d5695c8665d189cdf3328a09be169b87201c1e53895239c",
         "block_height"         =>119227,
         "block_index"         =>1,
         "block_transactions_count"         =>3,
         "inputs"         =>         [  
            {  
               "type"               =>"spend",
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "asset_definition"               =>               {  
                  "decimals"                  =>8,
                  "description"                  =>"Bytom Official Issue",
                  "name"                  =>"BTM",
                  "symbol"                  =>"BTM"
               },
               "amount"               =>4550000000,
               "control_program"               =>"0014040724739563503585bcf96b22bc5ae8857340c0",
               "address"               =>"tm1qqsrjguu4vdgrtpdul94j90z6azzhxsxqj64ym8",
               "spent_output_id"               =>"3911b9bea240594e7f0412de3088f7912096e2b15525ab1d997750c9e8fa2961",
               "input_id"               =>"a34cd66ff0a76cea49869d9aa019c0b4436d412f7faef246c0b0d2f16fe5823b",
               "witness_arguments"               =>               [  
                  "39ad2271c6aad68f6856acf701ab06174cc2ee23fad34dd0ed3ba2c30c711eaef8e3a83b067d6b76df57f714413ff79c39a0e60f264f054c0232b455dfb8bc03",
                  "b3ea1d30db23be82c4dd957382f33a2bf0cbe2b756334f50900e14e0fd13f8ce"
               ]
            }
         ],
         "outputs"         =>         [  
            {  
               "type"               =>"control",
               "id"               =>"f4b7d757f30a595209992e9146fe5e4f04be853ff14a6f0b1404571b7eb8df94",
               "position"               =>0,
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "asset_definition"               =>               {  
                  "decimals"                  =>8,
                  "description"                  =>"Bytom Official Issue",
                  "name"                  =>"BTM",
                  "symbol"                  =>"BTM"
               },
               "amount"               =>3540000000,
               "control_program"               =>"0014a3dc0032b66424a170d538185104dc9467f1f12a",
               "address"               =>"tm1q50wqqv4kvsj2zux48qv9zpxuj3nlruf282qyyh"
            },
            {  
               "type"               =>"control",
               "id"               =>"d49567a31855a8d83ce13e3d2169d753c7d117cb97739744d34a976b1ee6cdae",
               "position"               =>1,
               "asset_id"               =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
               "asset_alias"               =>"BTM",
               "asset_definition"               =>               {  
                  "decimals"                  =>8,
                  "description"                  =>"Bytom Official Issue",
                  "name"                  =>"BTM",
                  "symbol"                  =>"BTM"
               },
               "amount"               =>1000000000,
               "account_id"               =>"0NO14DLP00A02",
               "account_alias"               =>"dayone_account_001",
               "control_program"               =>"0014fdc6aa799423e32d20cea88ae0026bca3ec519a9",
               "address"               =>"tm1qlhr257v5y03j6gxw4z9wqqnteglv2xdf6jcc02"
            }
         ],
         "status_fail"         =>false,
         "size"         =>335
      }
   ]
}
```

----

#### `build-transaction`

Build transaction.

##### Parameters

`Object`:

- `String` - *base_transaction*, base data for the transaction, default is null.
- `Integer` - *ttl*, integer of the time to live in milliseconds, it means utxo will be reserved(locked) for builded transaction in this time range, if the transaction will not to be submitted into block, it will be auto unlocked for build transaction again after this ttl time. it will be set to 5 minutes(300 seconds) defaultly when ttl is 0.
- `Integer` - *time_range*, the block height at which this transaction will be allowed to be included in a block. If the block height of the main chain exceeds this value, the transaction will expire and no longer be valid.
- `Arrary of Object` - *actions*:
  - `Object`:
    - `String` - *account_id* | *account_alias*, (type is spend_account) alias or ID of account.
    - `String` - *asset_id* | *asset_alias*, (type is spend_account, issue, retire, control_program and control_address) alias or ID of asset.
    - `Integer` - *amount*, (type is spend_account, issue, retire, control_program and control_address) the specified asset of the amount sent with this transaction.
    - `String`- *type*, type of transaction, valid types: 'spend_account', 'issue', 'spend_account_unspent_output', 'control_address', 'control_program', 'retire'.
    - `String` - *address*, (type is control_address) address of receiver, the style of address is P2PKH or P2SH.
    - `String` - *control_program*, (type is control_program) control program of receiver.
    - `String` - *use_unconfirmed*, (type is spend_account and spend_account_unspent_output) flag of use unconfirmed UTXO, default is false.
    - `String` - *arbitrary*, (type is retire) arbitrary additional data by hexadecimal.
    - `Arrary of Object` - *arguments*, (type is issue and spend_account_unspent_output) arguments of contract, null when it's not contract.
      - `String`- *type*, type of argument, valid types: 'raw_tx_signature', 'data'.
      - `Object`- *raw_data*, json object of argument content.
        - `String`- *xpub*, (type is raw_tx_signature) root xpub.
        - `String`- *derivation_path*, (type is raw_tx_signature) derived path.
        - `String`- *value*, (type is data) string of binary value.

##### Returns

- `Object of build-transaction` - *transaction*, builded transaction.

##### Example

- `spend` - transaction type is spend
```ruby
bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')
actions = [
     {  
         account_id: "0NO14VPOG0A04",
         amount: 20000000,
         asset_id: "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         type: "spend_account"
      },
      {  
         account_id: "0NO14DLP00A02",
         amount: 99,
         asset_id: "9bd4bcc1e8a84ecabcd8e9f751181bc35e9377c91e46e1eb92f2c30767a67840",
         type: "spend_account"
      },
      {  
         amount: 99,
         asset_id: "9bd4bcc1e8a84ecabcd8e9f751181bc35e9377c91e46e1eb92f2c30767a67840",
         address: "tm1qgpw5p3t750jyapx8ecqjyvs5mkcr45h786ed32",
         type: "control_address"
      }
]
bytom_client.transactions.build_transaction(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)

// Request
curl -X POST build-transaction -d '{"base_transaction":null,"actions":[{"account_id":"0BF63M2U00A04","amount":20000000,"asset_id":"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","type":"spend_account"},{"account_id":"0BF63M2U00A04","amount":99,"asset_id":"3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680","type":"spend_account"},{"amount":99,"asset_id":"3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680","address":"bm1q50u3z8empm5ke0g3ngl2t3sqtr6sd7cepd3z68","type":"control_address"}],"ttl":0,"time_range": 43432}'
```

- `issue` - transaction type is issue
```ruby
#bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')
actions = [  
      {  
         account_id:"0NO14DLP00A02",
         amount: 20000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         type:"spend_account"
      },
      {  
         amount:10000,
         asset_id:"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         type:"issue"
      },
      {  
         amount:10000,
         asset_id: "41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         address: "tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz",
         type: "control_address"
      }
]

bytom_client.transactions.build_transaction(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)

# response data

{  
   "status"   =>"success",
   "data"   =>   {  
      "raw_transaction"      =>"0701a8d302020160015e5835d2a35141e44415bfb2277e0ba370cd43336931cfa31eff23db31ccd45394ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8094ebdc030101160014fdc6aa799423e32d20cea88ae0026bca3ec519a90100012c0008dbb2c6821a7487f241b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622904e2b027b7d0125ae204c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48885151ad0002013dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80baa6d303011600149ff0508a1fffcfb63028882085bfdb771a9fe39b00013a41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622904e0116001453d0b795fbc245ec4dfc1a34d22959c455e6e61900",
      "signing_instructions"      =>      [  
         {  
            "position"            =>0,
            "witness_components"            =>            [  
               {  
                  "type"                  =>"raw_tx_signature",
                  "quorum"                  =>1,
                  "keys"                  =>                  [  
                     {  
                        "xpub"                        =>"f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f",
                        "derivation_path"                        =>                        [  
                           "2c000000",
                           "99000000",
                           "01000000",
                           "00000000",
                           "02000000"
                        ]
                     }
                  ],
                  "signatures"                  =>nil
               },
               {  
                  "type"                  =>"data",
                  "value"                  =>"866b276a6c55a3925fda2708883321dc1dde9004503291d3255a296382618c4a"
               }
            ]
         },
         {  
            "position"            =>1,
            "witness_components"            =>            [  
               {  
                  "type"                  =>"raw_tx_signature",
                  "quorum"                  =>1,
                  "keys"                  =>                  [  
                     {  
                        "xpub"                        =>"f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f",
                        "derivation_path"                        =>                        [  
                           "000300000000000000"
                        ]
                     }
                  ],
                  "signatures"                  =>nil
               }
            ]
         }
      ],
      "fee"      =>20000000,
      "allow_additional_actions"      =>false
   }
}


# Request
curl -X POST http://127.0.0.1:9888/build-transaction -d '{"base_transaction":null,"actions":[{"account_id":"0NO14DLP00A02","amount":20000000,"asset_id":"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","type":"spend_account"},{"amount":10000,"asset_id":"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622","type":"issue"},{"amount":10000,"asset_id":"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622","address":"tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz","type":"control_address"}],"ttl":0,"time_range": 43432}'
```

- `address` - transaction type is address
```js
actions = [  
      {  
         account_id:"0NO14DLP00A02",
         amount: 20000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         type:"spend_account"
      },
      {  
         amount:10000,
         amount: 99,
         asset_id:"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         type:"spend_account"
      },
      {  
         amount:10000,
         asset_id: "41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         address: "tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz",
         type: "control_address"
      }
]

bytom_client.transactions.build_transaction(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)


// Request
curl -X POST build-transaction -d '{"base_transaction":null,"actions":[{"account_id":"0BF63M2U00A04","amount":20000000,"asset_id":"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","type":"spend_account"},{"account_id":"0BF63M2U00A04","amount":99,"asset_id":"3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680","type":"spend_account"},{"amount":99,"asset_id":"3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680","address":"bm1q50u3z8empm5ke0g3ngl2t3sqtr6sd7cepd3z68","type":"control_address"}],"ttl":0,"time_range": 43432}'
```

- `retire` - transaction type is retire
```ruby
actions = [  
      {  
         account_id:"0NO14DLP00A02",
         amount: 20000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         type:"spend_account"
      },
      {  
         amount:10000,
         amount: 99,
         asset_id:"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         type:"spend_account"
      },
      {  
         amount:10000,
         asset_id: "41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         arbitrary:"77656c636f6d65efbc8ce6aca2e8bf8ee69da5e588b0e58e9fe5ad90e4b896e7958c",
         type: "retire"
      }
]

bytom_client.transactions.build_transaction(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)
# Request
curl -X POST build-transaction -d '{"base_transaction":null,"actions":[{"account_id":"0BF63M2U00A04","amount":20000000,"asset_id":"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","type":"spend_account"},{"account_id":"0BF63M2U00A04","amount":99,"asset_id":"3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680","type":"spend_account"},{"amount":99,"asset_id":"3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680","arbitrary":"77656c636f6d65efbc8ce6aca2e8bf8ee69da5e588b0e58e9fe5ad90e4b896e7958c","type":"retire"}],"ttl":0,"time_range":43432}'
```

- `spend_account_unspent_output` - transaction type is spend_account_unspent_output(user can get UTXO information by call `list-unspent-outputs` API)

   attention:
   - action field `output_id` correspond to UTXO result `id` field
   - UTXO asset and amount will be spent in this transaction
   - transaction fee is (utxo asset_amount - output asset_amount)

```js

actions = [  
      {  
         type:"spend_account_unspent_output",
         output_id:"01c6ccc6f522228cd4518bba87e9c43fbf55fdf7eb17f5aa300a037db7dca0cb"
      },
      {  
         amount:41243000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         address:"sm1qmw8c5s29zlexknfahrze3ghvlqrtn2huuntvpn",
         type:"control_address"
      }
]

bytom_client.transactions.build_transaction(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)
// Request
curl -X POST build-transaction -d '{"base_transaction":null,"actions":[{"type":"spend_account_unspent_output","output_id":"01c6ccc6f522228cd4518bba87e9c43fbf55fdf7eb17f5aa300a037db7dca0cb"},{"amount":41243000000,"asset_id":"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","address":"sm1qmw8c5s29zlexknfahrze3ghvlqrtn2huuntvpn","type":"control_address"}],"ttl":0,"time_range":0}'
```

```js
// Result(this type is spend, the other types are similar.)
{
  "allow_additional_actions": false,
  "local": true,
  "raw_transaction": "07010000020161015fb6a63a3361170afca03c9d5ce1f09fe510187d69545e09f95548b939cd7fffa3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80fc93afdf01000116001426bd1b851cf6eb8a701c20c184352ad8720eeee90100015d015bb6a63a3361170afca03c9d5ce1f09fe510187d69545e09f95548b939cd7fffa33152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680c03e0101160014489a678741ccc844f9e5c502f7fac0a665bedb25010003013effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80a2cfa5df0101160014948fb4f500e66d20fbacb903fe108ee81f9b6d9500013a3152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc43680dd3d01160014cd5a822b34e3084413506076040d508bb12232c70001393152a15da72be51b330e1c0f8e1c0db669269809da4f16443ff266e07cc436806301160014a3f9111f3b0ee96cbd119a3ea5c60058f506fb1900",
  "signing_instructions": [
    {
      "position": 0,
      "witness_components": [
        {
          "keys": [
            {
              "derivation_path": [
                "010100000000000000",
                "0500000000000000"
              ],
              "xpub": "ee9dd8affdef7e0cacd0fbbf310217c7f588156c28e414db74c27afaedd8f876cf54547a672b431ff06ee8a146207df9595638a041b55ada1a764a8b5b30bda0"
            }
          ],
          "quorum": 1,
          "signatures": null,
          "type": "raw_tx_signature"
        },
        {
          "type": "data",
          "value": "62a73b6b7ffe52b6ad782b0e0efdc8309bf2f057d88f9a17d125e41bb11dbb88"
        }
      ]
    },
    {
      "position": 1,
      "witness_components": [
        {
          "keys": [
            {
              "derivation_path": [
                "010100000000000000",
                "0600000000000000"
              ],
              "xpub": "ee9dd8affdef7e0cacd0fbbf310217c7f588156c28e414db74c27afaedd8f876cf54547a672b431ff06ee8a146207df9595638a041b55ada1a764a8b5b30bda0"
            }
          ],
          "quorum": 1,
          "signatures": null,
          "type": "raw_tx_signature"
        },
        {
          "type": "data",
          "value": "ba5a63e7416caeb945eefc2ce874f40bc4aaf6005a1fc792557e41046f7e502f"
        }
      ]
    }
  ]
}
```

----
#### `build-chain-transactions`
Build chain transactions. To solve the problem of excessive utxo causing the transaction to fail, the utxo merge will be performed automatically. Currently, only btm transactions are supported.Warning, this feature requires the mine pool bytomd software to be higher than v1.0.6.


##### Parameters

`Object`:

- `String` - *base_transaction*, base data for the transaction, default is null.
- `Integer` - *ttl*, integer of the time to live in milliseconds, it means utxo will be reserved(locked) for builded transaction in this time range, if the transaction will not to be submitted into block, it will be auto unlocked for build transaction again after this ttl time. it will be set to 5 minutes(300 seconds) defaultly when ttl is 0.
- `Integer` - *time_range*, time stamp(block height)is maximum survival time for the transaction, the transaction will be not submit into block after this time stamp.
- `Arrary of Object` - *actions*:
  - `Object`:
    - `String` - *account_id* | *account_alias*, (type is spend_account) alias or ID of account.
    - `String` - *asset_id* | *asset_alias*, (type is spend_account, issue, retire, control_program and control_address) alias or ID of asset.
    - `Integer` - *amount*, (type is spend_account, issue, retire, control_program and control_address) the specified asset of the amount sent with this transaction.
    - `String`- *type*, type of transaction, valid types: 'spend_account', 'issue', 'spend_account_unspent_output', 'control_address', 'control_program', 'retire'.
    - `String` - *address*, (type is control_address) address of receiver, the style of address is P2PKH or P2SH.
    - `String` - *control_program*, (type is control_program) control program of receiver.
    - `String` - *use_unconfirmed*, (type is spend_account and spend_account_unspent_output) flag of use unconfirmed UTXO, default is false.
    - `Arrary of Object` - *arguments*, (type is issue and spend_account_unspent_output) arguments of contract, null when it's not contract.
      - `String`- *type*, type of argument, valid types: 'raw_tx_signature', 'data'.
      - `Object`- *raw_data*, json object of argument content.
        - `String`- *xpub*, (type is raw_tx_signature) root xpub.
        - `String`- *derivation_path*, (type is raw_tx_signature) derived path.
        - `String`- *value*, (type is data) string of binary value.

##### Returns

- `Object of raw_transaction` - *raw_transaction*, builded transactions.
- `Object of signing_instructions` - *signing_instructions*, Information used to sign a transactions.
##### Example

- `spend` - transaction type is spend
```js
actions = [  
      {  
         account_id:"0JCH28A600A02",
         amount:30000500000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         type:"spend_account"
      },
      {  
         amount:30000490000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         address:"sm1qx93sge8jkgzclc7pled7uqr596hjm2xe558lkr",
         type:"control_address"
      }
  ]

bytom_client.transactions.build_chain_transactions(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)


// Request
curl -X POST localhost:9888/build-chain-transactions -d '{"base_transaction": null,"actions":[{"account_id":"0JCH28A600A02","amount":30000500000000,"asset_id":"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","type": "spend_account"}, {"amount": 30000490000000,"asset_id": "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","address": "sm1qx93sge8jkgzclc7pled7uqr596hjm2xe558lkr","type": "control_address"}],"ttl": 1000000,"time_range": 0}'
```



----

#### `sign-transaction`

Sign transaction.

##### Parameters

`Object`:

- `String` - *password*, signature of the password.
- `Object` - *transaction*, builded transaction.

##### Returns

`Object`:

- `Boolean` - *sign_complete*, returns true if sign succesfully and false otherwise.
- `Object of sign-transaction` - *transaction*, signed transaction.

##### Example

```ruby
# Step 1: Build transaction 
actions = [  
      {  
         account_id:"0NO14DLP00A02",
         amount: 20000000,
         asset_id:"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
         type:"spend_account"
      },
      {  
         amount:10000,
         asset_id:"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         type:"issue"
      },
      {  
         amount:10000,
         asset_id: "41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
         address: "tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz",
         type: "control_address"
      }
]

res = bytom_client.transactions.build_transaction(
    base_transaction: nil, 
    ttl: 0, 
    time_range: 43432, 
    actions: actions
)

# Step 2 Sign transaction
transaction = {
   allow_additional_actions: false,
   local: true,
   raw_transaction: res['data']['raw_transaction'],
   signing_instructions: res['data']['signing_instructions']
}
sign_data = bytom_client.transactions.sign_transaction(
	password: '123456',
    transaction: transaction
)

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "transaction"      =>      {  
         "raw_transaction"         =>"0701a8d302020160015e5835d2a35141e44415bfb2277e0ba370cd43336931cfa31eff23db31ccd45394ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8094ebdc030101160014fdc6aa799423e32d20cea88ae0026bca3ec519a9220120866b276a6c55a3925fda2708883321dc1dde9004503291d3255a296382618c4a012c00086159bec99f1a083d41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622904e2b027b7d0125ae204c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48885151ad0002013dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80baa6d303011600149a9965716d974e3e9d797998359db12091db731500013a41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622904e0116001453d0b795fbc245ec4dfc1a34d22959c455e6e61900",
         "signing_instructions"         =>         [  
            {  
               "position"               =>0,
               "witness_components"               =>               [  
                  {  
                     "type"                     =>"raw_tx_signature",
                     "quorum"                     =>1,
                     "keys"                     =>                     [  
                        {  
                           "xpub"                           =>"f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f",
                           "derivation_path"                           =>                           [  
                              "2c000000",
                              "99000000",
                              "01000000",
                              "00000000",
                              "02000000"
                           ]
                        }
                     ],
                     "signatures"                     =>                     [  
                        ""
                     ]
                  },
                  {  
                     "type"                     =>"data",
                     "value"                     =>"866b276a6c55a3925fda2708883321dc1dde9004503291d3255a296382618c4a"
                  }
               ]
            },
            {  
               "position"               =>1,
               "witness_components"               =>               [  
                  {  
                     "type"                     =>"raw_tx_signature",
                     "quorum"                     =>1,
                     "keys"                     =>                     [  
                        {  
                           "xpub"                           =>"f788208af6d16ce5ae523256caedf8b9463f9cdfa33f58aa1ffde0b673c98769ceb9299052bddd6c8436d749500198635d77682eae565378ac16d1b9ba574e5f",
                           "derivation_path"                           =>                           [  
                              "000300000000000000"
                           ]
                        }
                     ],
                     "signatures"                     =>                     [  
                        ""
                     ]
                  }
               ]
            }
         ],
         "fee"         =>0,
         "allow_additional_actions"         =>false
      },
      "sign_complete"      =>false
   }
}
```
----

#### `sign-transactions`

Sign transactions used for batch signing transactions.

##### Parameters

`Object`:

- `String` - *password*, signature of the password.
- `Object` - *transaction*, builded transactions.

##### Returns

`Object`:

- `Boolean` - *sign_complete*, returns true if sign succesfully and false otherwise.
- `Object of sign-transactions` - *transaction*, signed transactions.

##### Example

```ruby
transaction1 = {
   allow_additional_actions: false,
   local: true,
   raw_transaction: res['data']['raw_transaction'],
   signing_instructions: res['data']['signing_instructions']
}
transaction2 = {
   allow_additional_actions: false,
   local: true,
   raw_transaction: res2['data']['raw_transaction'],
   signing_instructions: res2['data']['signing_instructions']
}
sign_data = bytom_client.transactions.sign_transactions(
	password: '123456',
    transactions: [
    	transaction1, transaction2
    ]
)

# Request
curl -X POST localhost:9888/sign-transactions -d '{"password":"123456","transactions":[{"raw_transaction":"0701000201620160a0d36052ca3d1335120ae48e1ffb2fb6b25588628eff90fa88bef3117dfb4301ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80ddb2c490e906010116001431630464f2b2058fe3c1fe5bee00742eaf2da8d901000161015f72de2064ab999acf22c05b5cf9c7d53164f80038b46b1ce426708514a30a3485ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80d4f4f69901000116001431630464f2b2058fe3c1fe5bee00742eaf2da8d9010001013fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8084c5b6aaea060116001431630464f2b2058fe3c1fe5bee00742eaf2da8d900","signing_instructions":[{"position":0,"witness_components":[{"type":"raw_tx_signature","quorum":1,"keys":[{"xpub":"b4d084e77bcda7fd8a37e31135200b2a6af98d19018674125dc6290dd14176f92523f229d9f1f3514b461f6931ac2073f586a35cd628c90270063725e6e1e983","derivation_path":["010100000000000000","0100000000000000"]}],"signatures":null},{"type":"data","value":"a86ab33efa9d71994270898ad99f198d60889ef617d5eaf25e776929a8973919"}]},{"position":1,"witness_components":[{"type":"raw_tx_signature","quorum":1,"keys":[{"xpub":"b4d084e77bcda7fd8a37e31135200b2a6af98d19018674125dc6290dd14176f92523f229d9f1f3514b461f6931ac2073f586a35cd628c90270063725e6e1e983","derivation_path":["010100000000000000","0100000000000000"]}],"signatures":null},{"type":"data","value":"a86ab33efa9d71994270898ad99f198d60889ef617d5eaf25e776929a8973919"}]}],"allow_additional_actions":false},{"raw_transaction":"0701000101620160571cc5d99a2994ff6b192bc9387838a3651245cb66dad4a6bc5f660310cebfa9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8084c5b6aaea06000116001431630464f2b2058fe3c1fe5bee00742eaf2da8d9010002013effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80faafed99010116001431630464f2b2058fe3c1fe5bee00742eaf2da8d900013fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80ddb2c490e9060116001431630464f2b2058fe3c1fe5bee00742eaf2da8d900","signing_instructions":[{"position":0,"witness_components":[{"type":"raw_tx_signature","quorum":1,"keys":[{"xpub":"b4d084e77bcda7fd8a37e31135200b2a6af98d19018674125dc6290dd14176f92523f229d9f1f3514b461f6931ac2073f586a35cd628c90270063725e6e1e983","derivation_path":["010100000000000000","0100000000000000"]}],"signatures":null},{"type":"data","value":"a86ab33efa9d71994270898ad99f198d60889ef617d5eaf25e776929a8973919"}]}],"allow_additional_actions":false}]}'
```

----

#### `submit-transaction`

Submit transaction.

##### Parameters

`Object`:

- `Object` - *raw_transaction*, raw_transaction of signed transaction.

##### Returns

`Object`:

- `String` - *tx_id*, transaction id, hash of transaction.

##### Example

```ruby
bytom_client.transactions.submit_transaction(
    raw_transaction: '0701a8d302020160015e5835d2a35141e44415bfb2277e0ba370cd43336931cfa31eff23db31ccd45394ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8094ebdc030101160014fdc6aa799423e32d20cea88ae0026bca3ec519a9220120866b276a6c55a3925fda2708883321dc1dde9004503291d3255a296382618c4a012c00086159bec99f1a083d41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622904e2b027b7d0125ae204c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48885151ad0002013dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80baa6d303011600149a9965716d974e3e9d797998359db12091db731500013a41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622904e0116001453d0b795fbc245ec4dfc1a34d22959c455e6e61900'
)
# response data
{
  "tx_id": "2c0624a7d251c29d4d1ad14297c69919214e78d995affd57e73fbf84ece316cb"
}
```
----

#### `submit-transactions`

Submit transactions used for batch submit transactions.

##### Parameters

`Object`:

- `Object` - *raw_transactions*, raw_transactions of signed transactions.

##### Returns

`Object`:

- `String` - *tx_id*, transactions id, hash of transactions.

##### Example

```ruby

bytom_client.transactions.submit_transaction(
	raw_transactions: [raw_transactions1, raw_transactions2]
)

# Request
curl -X POST localhost:9888/submit-transactions -d '{"raw_transactions":["0701000201620160a0d36052ca3d1335120ae48e1ffb2fb6b25588628eff90fa88bef3117dfb4301ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80ddb2c490e906010116001431630464f2b2058fe3c1fe5bee00742eaf2da8d9630240acb57bc06f7e5de99ef3e630ce34fc74c33d4694301202968092ca50ae7842e3331bfeb0cf7b65f383e27670c4d58aeeeb0b77e5355957ca729298d2b4e2470c20a86ab33efa9d71994270898ad99f198d60889ef617d5eaf25e776929a89739190161015f72de2064ab999acf22c05b5cf9c7d53164f80038b46b1ce426708514a30a3485ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80d4f4f69901000116001431630464f2b2058fe3c1fe5bee00742eaf2da8d96302404298424e89e5528f1d0cdd9028489b9d9e3f031ec34a74440cacc7900dc1eac9359c408a4342fc6cef935d2978919df8b23f3912ac4419800d375fac06ddb50620a86ab33efa9d71994270898ad99f198d60889ef617d5eaf25e776929a897391901013fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8084c5b6aaea060116001431630464f2b2058fe3c1fe5bee00742eaf2da8d900","0701000101620160571cc5d99a2994ff6b192bc9387838a3651245cb66dad4a6bc5f660310cebfa9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8084c5b6aaea06000116001431630464f2b2058fe3c1fe5bee00742eaf2da8d96302408c742d77eba6c56a8db8c114e60be6c6263df6120aefd7538376129d04ec71b78b718c2085bba85254b44bf4600ba31d4c5a7869d0be0c46d88bd5eb27490e0820a86ab33efa9d71994270898ad99f198d60889ef617d5eaf25e776929a897391902013effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80faafed99010116001431630464f2b2058fe3c1fe5bee00742eaf2da8d900013fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80ddb2c490e9060116001431630464f2b2058fe3c1fe5bee00742eaf2da8d900"]}'
```

----

#### `estimate-transaction-gas`

Estimate consumed neu(1BTM = 10^8NEU) for the transaction.

##### Parameters

`Object`:

- `Object` - *transaction_template*, builded transaction response.

##### Returns

`Object`:

- `Integer` - *total_neu*, total consumed neu(1BTM = 10^8NEU) for execute transaction, total_neu is rounded up storage_neu + vm_neu.
- `Integer` - *storage_neu*, consumed neu for storage transaction .
- `Integer` - *vm_neu*, consumed neu for execute VM.

##### Example

```ruby
transaction_template = {
    allow_additional_actions: false,
    raw_transaction: res['data']['raw_transaction'],
    signing_instructions: res['data']['signing_instructions']
}
bytom_client.transactions.estimate_transaction_gas(
    transaction_template: transaction_template
)


// Request
curl -X POST estimate-transaction-gas -d '{"transaction_template":{"allow_additional_actions":false,"raw_transaction":"070100010161015ffe8a1209937a6a8b22e8c01f056fd5f1730734ba8964d6b79de4a639032cecddffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8099c4d59901000116001485eb6eee8023332da85df60157dc9b16cc553fb2010002013dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80afa08b4f011600142b4fd033bc76b4ddf5cb00f625362c4bc7b10efa00013dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8090dfc04a011600146eea1ce6cfa5b718ae8094376be9bc1a87c9c82700","signing_instructions":[{"position":0,"witness_components":[{"keys":[{"derivation_path":["010100000000000000","0100000000000000"],"xpub":"cb4e5932d808ee060df9552963d87f60edac42360b11d4ad89558ef2acea4d4aaf4818f2ebf5a599382b8dfce0a0c798c7e44ec2667b3a1d34c61ba57609de55"}],"quorum":1,"signatures":null,"type":"raw_tx_signature"},{"type":"data","value":"1c9b5c1db7f4afe31fd1b7e0495a8bb042a271d8d7924d4fc1ff7cf1bff15813"}]}]}}'

# Result
{
  "storage_neu": 3840000,
  "total_neu": 5259000,
  "vm_neu": 1419000
}
```

----

#### `create-access-token`

Create access token, it provides basic access authentication for HTTP protocol, returns token contain username and password, they are separated by a colon.

##### Parameters

`Object`:

- `String` - *id*, token ID.

optional:

- `String` - *type*, type of token.

##### Returns

`Object`:

- `String` - *token*, access token, authentication username and password are separated by a colon.
- `String` - *id*, token ID.
- `String` - *type*, type of token.
- `Object` - *created_at*, time to create token.

##### Example

create access token.

```ruby
bytom_client.access_token.create_access_token(id: 'token001')

# Response data
{
    "status" = >"success",
    "data" = >{
        "id" = >"token1",
        "token" = >"token1:f5ed3ac7f67953c2695acb4ed0a1e0b0afca813af8142d00db3c72fe42993701",
        "created_at" = >"2019-01-15T19:19:22.391278+08:00"
    }
}
```

----

#### `list-access-tokens`

Returns the list of all available access tokens.

##### Parameters

none

##### Returns

- `Array of Object`, access token array.
  - `Object`:
    - `String` - *token*, access token.
    - `String` - *id*, token ID.
    - `String` - *type*, type of token.
    - `Object` - *created_at*, time to create token.

##### Example

list all the available access tokens.

```ruby
#bytom_client = Bytom::Client.new(base_url: 'http://127.0.0.1:9888')
bytom_client.access_token.list_access_tokens

// Result
{
    "status" = >"success",
    "data" = >[{
        "id" = >"token1",
        "token" = >"token1:f5ed3ac7f67953c2695acb4ed0a1e0b0afca813af8142d00db3c72fe42993701",
        "created_at" = >"2019-01-15T19:19:22.391278+08:00"
    }]
}
```

----

#### `delete-access-token`

Delete existed access token.

##### Parameters

`Object`:

- `String` - *id*, token ID.

##### Returns

none if the access token is deleted successfully.

##### Example

delete access token.

```ruby

bytom_client.access_token.delete_access_token(id: 'token004')

# Response data
```

----

#### `check-access-token`

Check access token is valid.

##### Parameters

`Object`:

- `String` - *id*, token ID.
- `String` - *secret*, secret of token, the second part of the colon division for token.

##### Returns

none if the access token is checked valid.

##### Example

check whether the access token is vaild or not.

```ruby
bytom_client.access_token.check_access_token(
	id: 'token001',
    secret: 'c12804d862e186bc206c1b80329145cf6d861bab676f81f45254c57a8a289b52'    
)
```

----

#### `create-transaction-feed`

Create transaction feed.

##### Parameters

`Object`:

- `String` - *alias*, name of the transaction feed.
- `String` - *filter*, filter of the transaction feed.

##### Returns

none if the transaction feed is created success.

##### Example

```ruby
bytom_client.transactions.create_transaction_feed(
    alias_name: 'test1',
    filter: "asset_id='0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5' AND amount_lower_limit = 50 AND amount_upper_limit = 100"
)
```

----

#### `get-transaction-feed`

Query detail transaction feed by name.

##### Parameters

`Object`:

- `String` - *alias*, name of the transaction feed.

##### Returns

`Object`:

- `String` - *id*, id of the transaction feed.
- `String` - *alias*, name of the transaction feed.
- `String` - *filter*, filter of the transaction feed.
- `Object` - *param*, param of the transaction feed.
  - `String` - *assetid*, asset id.
  - `Integer` - *lowerlimit*, the lower limit of asset amount.
  - `Integer` - *upperlimit*, the upper limit of asset amount.
  - `String` - *transtype*, type of transaction.

##### Example

list the available txfeed by alias:

```js
bytom_client.transactions.get_transaction_feed(alias_name: 'test1')

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "txfeed"      =>      {  
         "alias"         =>"test1",
         "filter"         =>"asset_id='0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5' AND amount_lower_limit = 50 AND amount_upper_limit = 100",
         "param"         =>         {  
            "assetid"            =>"0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5",
            "lowerlimit"            =>50,
            "upperlimit"            =>100
         }
      }
   }
}
```

----

#### `list-transaction-feeds`

Returns the list of all available transaction feeds.

##### Parameters

none

##### Returns

- `Array of Object`, the transaction feeds.
  - `Object`:
    - `String` - *id*, id of the transaction feed.
    - `String` - *alias*, name of the transaction feed.
    - `String` - *filter*, filter of the transaction feed.
    - `Object` - *param*, param of the transaction feed.
      - `String` - *assetid*, asset id.
      - `Integer` - *lowerlimit*, the lower limit of asset amount.
      - `Integer` - *upperlimit*, the upper limit of asset amount.
      - `String` - *transtype*, type of transaction.

##### Example

list all the available txfeed:

```ruby
bytom_client.transactions.list_transaction_feeds

# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "alias"         =>"test1",
         "filter"         =>"asset_id='0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5' AND amount_lower_limit = 50 AND amount_upper_limit = 100",
         "param"         =>         {  
            "assetid"            =>"0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5",
            "lowerlimit"            =>50,
            "upperlimit"            =>100
         }
      }
   ]
}
```

----

#### `delete-transaction-feed`

Delete transaction feed by name.

##### Parameters

`Object`:

- `String` - *alias*, name of the transaction feed.

##### Returns

none if the transaction feed is deleted success.

##### Example

```ruby
bytom_client.transactions.delete_transaction_feed(alias_name: 'test1')
```

----

#### `update-transaction-feed`

Update transaction feed.

##### Parameters

`Object`:

- `String` - *alias*, name of the transaction feed.
- `String` - *filter*, filter of the transaction feed.

##### Returns

none if the transaction feed is updated success.

##### Example

deleted when the txfeed exists, and create it with alias and filter:

```ruby
bytom_client.transactions.update_transaction_feed(
    alias_name: 'test1',
    filter: "asset_id='0e11c2fa26623b3b1580d2b04a9cebb1ed13e04c18929fc1ac8c11ae62b87db5' AND amount_lower_limit = 150 AND amount_upper_limit = 300"
)
```

----

#### `get-unconfirmed-transaction`

Query mempool transaction by transaction ID.

##### Parameters

`Object`:

- `String` - *tx_id*, transaction id, hash of transaction.

##### Returns

`Object`:

- `String` - *id*, transaction id, hash of the transaction.
- `Integer` - *version*, version of transaction.
- `Integer` - *size*, size of transaction.
- `Integer` - *time_range*, the time range of transaction.
- `Boolean` - *status_fail*, whether the state of the request has failed.
- `String` - *mux_id*, the previous transaction mux id(wallet enable can be acquired, this place is empty).
- `Array of Object` - *inputs*, object of inputs for the transaction(input struct please refer to get-transction API description).
- `Array of Object` - *outputs*, object of outputs for the transaction(output struct please refer to get-transction API description).

##### Example

```ruby
bytom_client.transactions.get_unconfirmed_transaction(
    tx_id: "b9cfc401cba53c6a873c8df40cf68f474314495f73828c206606d803426c48b9"
)

# Request
curl -X POST get-unconfirmed-transaction -d '{"tx_id": "382090f24fbfc2f737fa7372b9d161a43f00d1c597a7130a56589d1f469d04b5"}'

# Result
{
  "id": "382090f24fbfc2f737fa7372b9d161a43f00d1c597a7130a56589d1f469d04b5",
  "inputs": [
    {
      "address": "bm1qqrm7ruecx7yrg9smtwmnmgj3umg9vcukgy5sdj",
      "amount": 41250000000,
      "asset_definition": {},
      "asset_id": "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
      "control_program": "001400f7e1f338378834161b5bb73da251e6d0566396",
      "input_id": "a0c2fa0719bfe1446681537dcf1f8d0f03add093e29d12481eb807e07778d7b3",
      "spent_output_id": "161b44e547a6cc68d732eb64fa38031da98211a99319e088cfe632223f9ac6d8",
      "type": "spend",
      "witness_arguments": [
        "cf0e1b217ab92ade8e81fab10f9f307bb5cc1ad947b5629e3f7a760aba722f5044f2ab59ec92fa4264ff5811de4361abb6eabd7e75ffd28a813a98ceff434c01",
        "6890a19b21c326059eef211cd8414282a79d3b9203f2592064221fd360e778a7"
      ]
    }
  ],
  "mux_id": "842cd07eed050b547377b5b123f14a5ec0d76933d564f030cf4d5d5c15769645",
  "outputs": [
    {
      "address": "bm1qehxd5cdnepckh5jc72ggn30havd78lsgcqmt7k",
      "amount": 21230000000,
      "asset_definition": {},
      "asset_id": "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
      "control_program": "0014cdccda61b3c8716bd258f29089c5f7eb1be3fe08",
      "id": "a8f21ad24689c290634db85278f56d152efe6fe08bc194e5dee5127ed6d3ebee",
      "position": 0,
      "type": "control"
    },
    {
      "address": "bm1q2me9gwccnm3ehpnrcr99gcnj730js2zfucms3r",
      "amount": 20000000000,
      "asset_definition": {},
      "asset_id": "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
      "control_program": "001456f2543b189ee39b8663c0ca546272f45f282849",
      "id": "78219e422ea3257aeb32f6d952b5ce5560dab1d6440c9f3aebcdaad2a852d2a8",
      "position": 1,
      "type": "control"
    }
  ],
  "size": 664,
  "status_fail": false,
  "time_range": 0,
  "version": 1
}
```

----

#### `list-unconfirmed-transactions`

Returns the total number of mempool transactions and the list of transaction IDs.

##### Parameters

none

##### Returns

`Object`:

- `Integer` - *total*, version of transaction.
- `Array of Object` - *tx_ids*, list of transaction id.

##### Example

```js
bytom_client.transactions.list_unconfirmed_transactions
```

----

#### `decode-raw-transaction`

Decode a serialized transaction hex string into a JSON object describing the transaction.

##### Parameters

`Object`:

- `String` - *raw_transaction*, hexstring of raw transaction.

##### Returns

`Object`:

- `String` - *tx_id*, transaction ID.
- `Integer` - *version*, version of transaction.
- `String` - *size*, size of transaction.
- `String` - *time_range*, time range of transaction.
- `String` - *fee*, fee for sending transaction.
- `Array of Object` - *inputs*, object of inputs for the transaction(input struct please refer to get-transction API description).
- `Array of Object` - *outputs*, object of outputs for the transaction
(output struct please refer to get-transction API description).

##### Example

```js
bytom_client.transactions.decode_raw_transaction(
    raw_transaction: res['data']['raw_transaction'],
)

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "tx_id"      =>"63ac0ffebbcd577fc95395525f4d1ddc81ca38ed62fe6d2640f0e6bc1bd8f6f3",
      "version"      =>1,
      "size"      =>322,
      "time_range"      =>129279,
      "inputs"      =>      [  
         {  
            "type"            =>"spend",
            "asset_id"            =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            "asset_definition"            =>            {  

            },
            "amount"            =>1000000000,
            "control_program"            =>"0014fdc6aa799423e32d20cea88ae0026bca3ec519a9",
            "address"            =>"tm1qlhr257v5y03j6gxw4z9wqqnteglv2xdf6jcc02",
            "spent_output_id"            =>"d49567a31855a8d83ce13e3d2169d753c7d117cb97739744d34a976b1ee6cdae",
            "input_id"            =>"2ff98451f59d4e9769f589a870ca871e145614ecc0331fef8f50029b799ba3e8",
            "witness_arguments"            =>nil
         },
         {  
            "type"            =>"issue",
            "asset_id"            =>"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
            "asset_definition"            =>            {  

            },
            "amount"            =>10000,
            "issuance_program"            =>"ae204c09d66bfad30f9017ad2283484f3931810bfe7821f75427cb1417bac08b48885151ad",
            "input_id"            =>"d230e75ef6b01f1b2594252bfd2e72b013ceeb276f27e892f3e84f068a914c66",
            "witness_arguments"            =>nil
         }
      ],
      "outputs"      =>      [  
         {  
            "type"            =>"control",
            "id"            =>"d7ffe22616e60bcddc345472c3b9aae651e4c9f980a52adfabc833883fa642d8",
            "position"            =>0,
            "asset_id"            =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            "asset_definition"            =>            {  

            },
            "amount"            =>999999999,
            "control_program"            =>"00147e420650ad8523f75e26c87e7023dc0c2d14203e",
            "address"            =>"tm1q0epqv59ds53lwh3xepl8qg7upsk3ggp7mv4a3y"
         },
         {  
            "type"            =>"control",
            "id"            =>"becc0f1c070ab1a182c38903a47111e36fe080721db9088d1466e24f32369601",
            "position"            =>1,
            "asset_id"            =>"41b2c7a02e610c9e7117e5b2407573b953b3ebbec90302cf217ecaf134851622",
            "asset_definition"            =>            {  

            },
            "amount"            =>10000,
            "control_program"            =>"001453d0b795fbc245ec4dfc1a34d22959c455e6e619",
            "address"            =>"tm1q20gt090mcfz7cn0urg6dy22ec327deseew7vtz"
         }
      ],
      "fee"      =>1
   }
}
```

----

#### `get-block-count`

Returns the current block height for blockchain.

##### Parameters

none

##### Returns

`Object`:

- `Integer` - *block_count*, recent block height of the blockchain.

##### Example

```ruby
bytom_client.block.get_block_count

# response data
{"status"=>"success", "data"=>{"block_count"=>119279}}
```

----

#### `get-block-hash`

Returns the current block hash for blockchain.

##### Parameters

none

##### Returns

`Object`:

- `String` - *block_hash*, recent block hash of the blockchain.

##### Example

```ruby
bytom_client.block.get_block_hash
# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "block_hash"      =>"a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0"
   }
}

```

----

#### `get-block`

Returns the detail block by block height or block hash.

##### Parameters

`Object`: block_height | block_hash

optional:

- `String` - *block_hash*, hash of block.
- `Integer` - *block_height*, height of block.

##### Returns

`Object`:

- `String` - *hash*, hash of block.
- `Integer` - *size*, size of block.
- `Integer` - *version*, version of block.
- `Integer` - *height*, height of block.
- `String` - *previous_block_hash*, previous block hash.
- `Integer` - *timestamp*, timestamp of block.
- `Integer` - *nonce*, nonce value.
- `Integer` - *bits*, bits of difficulty.
- `String` - *difficulty*, difficulty value(String type).
- `String` - *transaction_merkle_root*, merkle root of transaction.
- `String` - *transaction_status_hash*, merkle root of transaction status.
- `Array of Object` - *transactions*, transaction object:
  - `String` - *id*, transaction id, hash of the transaction.
  - `Integer` - *version*, version of transaction.
  - `Integer` - *size*, size of transaction.
  - `Integer` - *time_range*, the unix timestamp for when the requst was responsed.
  - `Boolean` - *status_fail*, whether the state of the request has failed.
  - `String` - *mux_id*, the previous transaction mux id(source id of utxo).
  - `Array of Object` - *inputs*, object of inputs for the transaction.
    - `String` - *type*, the type of input action, available option include: 'spend', 'issue', 'coinbase'.
    - `String` - *asset_id*, asset id.
    - `String` - *asset_alias*, name of asset.
    - `Object` - *asset_definition*, definition of asset(json object).
    - `Integer` - *amount*, amount of asset.
    - `Object` - *issuance_program*, issuance program, it only exist when type is 'issue'.
    - `Object` - *control_program*, control program of account, it only exist when type is 'spend'.
    - `String` - *address*, address of account, it only exist when type is 'spend'.
    - `String` - *spent_output_id*, the front of outputID to be spent in this input, it only exist when type is 'spend'.
    - `String` - *account_id*, account id.
    - `String` - *account_alias*, name of account.
    - `Object` - *arbitrary*, arbitrary infomation can be set by miner, it only exist when type is 'coinbase'.
    - `String` - *input_id*, hash of input action.
    - `Array of String` - *witness_arguments*, witness arguments.
  - `Array of Object` - *outputs*, object of outputs for the transaction.
    - `String` - *type*, the type of output action, available option include: 'retire', 'control'.
    - `String` - *id*, outputid related to utxo.
    - `Integer` - *position*, position of outputs.
    - `String` - *asset_id*, asset id.
    - `String` - *asset_alias*, name of asset.
    - `Object` - *asset_definition*, definition of asset(json object).
    - `Integer` - *amount*, amount of asset.
    - `String` - *account_id*, account id.
    - `String` - *account_alias*, name of account.
    - `Object` - *control_program*, control program of account.
    - `String` - *address*, address of account.

##### Example

get specified block information by block_hash or block_height, if both exists, the block result is querying by hash.

```js

bytom_client.block.get_block

bytom_client.block.get_block(block_height: 43)

bytom_client.block.get_block(
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'
)

bytom_client.block.get_block(
    block_height: 43,
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'  
)

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "hash"      =>"a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0",
      "size"      =>416,
      "version"      =>1,
      "height"      =>119245,
      "previous_block_hash"      =>"2c8d50e96d0e305b3624f123cefd9d169af39e88d00660964520cdb76de58bae",
      "timestamp"      =>1547718202,
      "nonce"      =>1549238276311745739,
      "bits"      =>2161727821144505872,
      "difficulty"      =>"164898",
      "transaction_merkle_root"      =>"1795c62190871d0090232b8376be80d1b64d70b7d7ea522621e330654a644339",
      "transaction_status_hash"      =>"c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc",
      "transactions"      =>      [  
         {  
            "id"            =>"03283cc7c87a2ba003e8173a76c1d1e7b646e5dfd01bf8e101678388fe30497c",
            "version"            =>1,
            "size"            =>82,
            "time_range"            =>0,
            "inputs"            =>            [  
               {  
                  "type"                  =>"coinbase",
                  "asset_id"                  =>"0000000000000000000000000000000000000000000000000000000000000000",
                  "asset_definition"                  =>                  {  

                  },
                  "amount"                  =>0,
                  "arbitrary"                  =>"00313139323435",
                  "input_id"                  =>"c5a0a1aaac554f0ca7de619c2e5c3b994f0cc103c69ff0f7c85069e6d30c5441",
                  "witness_arguments"                  =>nil
               }
            ],
            "outputs"            =>            [  
               {  
                  "type"                  =>"control",
                  "id"                  =>"b0d685df2de322d1edcd7070778de23a7feffc4bc24ddb24d1f32593f525f94c",
                  "position"                  =>0,
                  "asset_id"                  =>"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
                  "asset_definition"                  =>                  {  

                  },
                  "amount"                  =>41250000000,
                  "control_program"                  =>"0014ae14495b8dee5dd129e3c6db33963f112af34a91",
                  "address"                  =>"tm1q4c2yjkudaewaz20rcmdn893lzy40xj53z50n4n"
               }
            ],
            "status_fail"            =>false,
            "mux_id"            =>"dad789ffcf9164cc479d4eb35f46328fbd9c30cc0f88a13d624e3f3cf47a27f3"
         }
      ]
   }
}
```

----

#### `get-block-header`

Returns the detail block header by block height or block hash.

##### Parameters

`Object`: block_height | block_hash

optional:

- `String` - *block_hash*, hash of block.
- `Integer` - *block_height*, height of block.

##### Returns

`Object`:

- `Object` - *block_header*, header of block.
- `Integer` - *reward*, reward.

##### Example

```js
bytom_client.block.get_block_header

bytom_client.block.get_block_header(block_height: 43)

bytom_client.block.get_block_header(
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'
)

bytom_client.block.get_block_header(
    block_height: 43,
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'  
)

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "block_header"      =>"0101cda3072c8d50e96d0e305b3624f123cefd9d169af39e88d00660964520cdb76de58baeba9c81e205401795c62190871d0090232b8376be80d1b64d70b7d7ea522621e330654a644339c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bccb8980e0908080c01590fc9683808080801e",
      "reward"      =>41250000000
   }
}
```

----

#### `get-difficulty`

Returns the block difficulty by block height or block hash.

##### Parameters

`Object`:

optional:

- `String` - *block_hash*, hash of block.
- `Integer` - *block_height*, height of block.

##### Returns

`Object`:

- `Integer` - *bits*, bits of block.
- `String` - *difficulty*, difficulty of block.
- `String` - *hash*, block hash.
- `Integer` - *height*, block height.

##### Example

Get difficulty for specified block hash / height.

```js
bytom_client.block.get_difficulty

bytom_client.block.get_difficulty(block_height: 43)

bytom_client.block.get_difficulty(
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'
)

bytom_client.block.get_difficulty(
    block_height: 43,
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'  
)

# Response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "hash"      =>"a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0",
      "height"      =>119245,
      "bits"      =>2161727821144505872,
      "difficulty"      =>"164898"
   }
}
```

----

#### `get-hash-rate`

Returns the block hash rate by block height or block hash, it returns the current block hash rate when request is empty.

##### Parameters

`Object`:

optional:

- `String` - *block_hash*, hash of block.
- `Integer` - *block_height*, height of block.

##### Returns

`Object`:

- `Integer` - *hash_rate*, difficulty of block.
- `String` - *hash*, block hash.
- `Integer` - *height*, block height.

##### Example

Get hash rate for specified block hash / height.

```js
bytom_client.block.get_hash_rate

bytom_client.block.get_hash_rate(block_height: 43)

bytom_client.block.get_hash_rate(
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'
)

bytom_client.block.get_hash_rate(
    block_height: 43,
    block_hash: 'a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0'  
)

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "hash"      =>"a9b249236daa0b752ba4e409f89b27d44a4b6838289af917b3fe933520defaf0",
      "height"      =>119245,
      "hash_rate"      =>975
   }
}
```

----

#### `net-info`

Returns the information of current network node.

##### Parameters

none

##### Returns

`Object`:

- `Boolean` - *listening*, whether the node is listening.
- `Boolean` - *syncing*, whether the node is syncing.
- `Boolean` - *mining*, whether the node is mining.
- `Integer` - *peer_count*, current count of connected peers.
- `Integer` - *current_block*, current block height in the node's blockchain.
- `Integer` - *highest_block*, current highest block of the connected peers.
- `String` - *network_id*, network id.
- `Object` - *version_info*, bytomd version information:
    * `String` - *version*, current version of the running `bytomd`.
    * `uint16` - *update*, whether there exists an update.
        + 0: no update;
        + 1: small update;
        + 2: significant update.
    * `String` - *new_version*, the newest version of `bytomd` if there is one.

##### Example

```ruby
bytom_client.core_config.net_info

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "listening"      =>true,
      "syncing"      =>false,
      "mining"      =>false,
      "peer_count"      =>1,
      "current_block"      =>119248,
      "highest_block"      =>119248,
      "network_id"      =>"wisdom",
      "version_info"      =>      {  
         "version"         =>"1.0.7+9e872c03",
         "update"         =>0,
         "new_version"         =>"1.0.7+9e872c03"
      }
   }
}
```

----

#### `is-mining`

Returns the mining status.

##### Parameters

none

##### Returns

`Object`:

- `Boolean` - *is_mining*, whether the node is mining.

##### Example

```ruby
bytom_client.core_config.is_mining

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "is_mining"      =>false
   }
}
```

----

### `set-mining`

Start up node mining.

##### Parameters

`Object`:

- `Boolean` - *is_mining*, whether the node is mining.

##### Example

```js
bytom_client.core_config.set_mining(is_mining:true)

```

----

#### `gas-rate`

Quary gas rate.

##### Parameters

none

##### Returns

`Object`:

- `Integer` - *gas_rate*, gas rate.

##### Example

```js
bytom_client.core_config.gas_rate
	
# response data
{"status"=>"success", "data"=>{"gas_rate"=>200}}
```

----

#### `verify-message`

Verify a signed message with derived pubkey of the address.

##### Parameters

`Object`:

- `String` - *address*, address for account.
- `String` - *derived_xpub*, derived xpub.
- `String` - *message*, message for signature by derived_xpub.
- `String` - *signature*, signature for message.

##### Returns

`Object`:

- `Boolean` - *result*, verify result.

##### Example

```ruby

bytom_client.message.verify_message(
    address: "bm1qx2qgvvjz734ur8x5lpfdtlau74aaa5djs0a5jn",
    derived_xpub: "6ff8c3d1321ce39a3c3550f57ba70b67dcbcef821e9b85f6150edb7f2f3f91009e67f3075e6e76ed5f657ee4b1a5f4749b7a8c74c8e7e6a1b0e5918ebd5df4d0",
    message: "this is a test message",
    signature: "74da3d6572233736e3a439166719244dab57dd0047f8751b1efa2da26eeab251d915c1211dcad77e8b013267b86d96e91ae67ff0be520ef4ec326e911410b609"
)

// Request
curl -X POST http://127.0.0.1:9888/verify-message -d '{"address":"bm1qx2qgvvjz734ur8x5lpfdtlau74aaa5djs0a5jn", "derived_xpub":"6ff8c3d1321ce39a3c3550f57ba70b67dcbcef821e9b85f6150edb7f2f3f91009e67f3075e6e76ed5f657ee4b1a5f4749b7a8c74c8e7e6a1b0e5918ebd5df4d0", "message":"this is a test message", "signature":"74da3d6572233736e3a439166719244dab57dd0047f8751b1efa2da26eeab251d915c1211dcad77e8b013267b86d96e91ae67ff0be520ef4ec326e911410b609"}'

// Result
{
  "result": true
}
```

----

#### `compile`

Compile equity contract.

##### Parameters

`Object`:

- `String` - *contract*, content of equity contract.

Optional:

- `Array of Object` - *args*, parameters of contract.
  - `Boolean` - *boolean*, boolean parameter.
  - `Integer` - *integer*, integer parameter.
  - `String` - *string*, string parameter.

##### Returns

`Object`:

- `String` - *name*, contract name.
- `String` - *source*, source content of contract.
- `String` - *program*, generated program by compiling contract.
- `Array of Object` - *params*, parameters of contract.
- `String` - *value*, locked value name of contract.
- `Array of Object` - *clause_info*, clauses of contract.
- `String` - *opcodes*, opcodes of contract.
- `String` - *error*, returned error information for compiling contract.

##### Example

```ruby
bytom_client.other.compile(
    contract: "contract LockWithPublicKey(publicKey: PublicKey) locks valueAmount of valueAsset { clause unlockWithSig(sig: Signature) { verify checkTxSig(publicKey, sig) unlock valueAmount of valueAsset } }",
    args: [
        {
            string: "e9108d3ca8049800727f6a3505b3a2710dc579405dde03c250f16d9a7e1e6e78"
        }
    ]
)

# Result
{
  "name": "LockWithPublicKey",
  "source": "contract LockWithPublicKey(publicKey: PublicKey) locks valueAmount of valueAsset { clause unlockWithSig(sig: Signature) { verify checkTxSig(publicKey, sig) unlock valueAmount of valueAsset } }",
  "program": "20e9108d3ca8049800727f6a3505b3a2710dc579405dde03c250f16d9a7e1e6e787403ae7cac00c0",
  "params": [
    {
      "name": "publicKey",
      "type": "PublicKey"
    }
  ],
  "value": "valueAmount of valueAsset",
  "clause_info": [
    {
      "name": "unlockWithSig",
      "params": [
        {
          "name": "sig",
          "type": "Signature"
        }
      ],
      "values": [
        {
          "name": "",
          "asset": "valueAsset",
          "amount": "valueAmount"
        }
      ]
    }
  ],
  "opcodes": "0xe9108d3ca8049800727f6a3505b3a2710dc579405dde03c250f16d9a7e1e6e78 DEPTH 0xae7cac FALSE CHECKPREDICATE",
  "error": ""
}
```



----

#### `list-peers`

Returns the list of connected peers.

##### Parameters

none

##### Returns

- `Array of Object`, connected peers.
  - `Object`:
    - `String` - *peer_id*, peer id.
    - `String` - *remote_addr*, the address(IP and port) of connected peer.
    - `Integer` - *height*, the current height of connected peer.
    - `String` - *ping*, the delay time of connected peer.
    - `String` - *duration*, the connected time.
    - `Integer` - *total_sent*, total data sent in byte.
    - `Integer` - *total_received*, total data received in byte.
    - `Integer` - *average_sent_rate*, average data sent rate in byte.
    - `Integer` - *average_received_rate*, average data received rate in byte.
    - `Integer` - *current_sent_rate*, current data sent rate in byte.
    - `Integer` - *current_received_rate*, current data received rate in byte.

##### Example

```js
bytom_client.peer.list_peers
# response data
{  
   "status"   =>"success",
   "data"   =>   [  
      {  
         "peer_id"         =>"3B58D7139B53066F2031FC1F027D2B3423FA4CE01F1FB1CC2DC4003C78413C24",
         "remote_addr"         =>"52.83.251.197:46656         ", "         height"=>119253,
         "ping"         =>"40ms",
         "duration"         =>"1h29m55.68s",
         "total_sent"         =>9400,
         "total_received"         =>79809,
         "average_sent_rate"         =>2,
         "average_received_rate"         =>15,
         "current_sent_rate"         =>0,
         "current_received_rate"         =>0
      }
   ]
}
```

----

#### `disconnect-peer`

Disconnect to specified peer.

##### Parameters

`Object`:

- `String` - *peer_id*, peer id.

##### Returns

none if disconnect peer successfully.

##### Example

```js
bytom_client.peer.disconnect_peer(
    peer_id: '3B58D7139B53066F2031FC1F027D2B3423FA4CE01F1FB1CC2DC4003C78413C24'
)

```

----

#### `connect-peer`

Connect to specified peer.

##### Parameters

`Object`:

- `String` - *ip*, peer IP address.
- `Integer` - *port*, peer port.

##### Returns

`Object`:

- `String` - *peer_id*, peer id.
- `String` - *remote_addr*, the address(IP and port) of connected peer.
- `Integer` - *height*, the current height of connected peer.
- `Integer` - *delay*, the delay time of connected peer.

##### Example

```js
bytom_client.peer.connect_peer(
	ip:"139.198.177.164", 
    port:46657
)
# Result
{
  "peer_id" => "29661E8BB9A8149F01C6594E49EA80C6B18BF247946A7E2E01D8235BBBFC3594",
  "remote_addr" => "139.198.177.164:46657",
  "height"=> 65941,
  "delay" => 0
}
```

----

#### `get-work`

Get the proof of work.

##### Parameters

none

##### Returns

`Object`:

- `Object` - *block_header*, raw block header.
- `String` - *seed*, seed.

##### Example

```js
bytom_client.work.get_work

# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "block_header"      =>"0101d6a3078336f0926cb157d6b43f8acbb62b643eb86d6b12a88bd05a24befbbf7d7578db8faf81e205403968cdf061c37bd620c02f497e847473a8a4669fbbc0bb936bd5c8305d08ff01c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc0090fc9683808080801e",
      "seed"      =>"be00f0b385475ea5578060b76e6bd4186468e797049f673580de3d7855500f21"
   }
}
```

----

#### `submit-work`

Submit the proof of work.

##### Parameters

`Object`:

- `Object` - *block_header*, raw block header.

##### Returns

true if success

##### Example

```ruby
bytom_client.work.submit_work(
    block_header:    "0101d6a3078336f0926cb157d6b43f8acbb62b643eb86d6b12a88bd05a24befbbf7d7578db8faf81e205403968cdf061c37bd620c02f497e847473a8a4669fbbc0bb936bd5c8305d08ff01c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc0090fc9683808080801e"
)
// Request
curl -X POST http://127.0.0.1:9888/submit-work -d '{"block_header": "0101d6a3078336f0926cb157d6b43f8acbb62b643eb86d6b12a88bd05a24befbbf7d7578db8faf81e205403968cdf061c37bd620c02f497e847473a8a4669fbbc0bb936bd5c8305d08ff01c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc0090fc9683808080801e"}'

// Result
true / error
```

----

#### `get-work-json`

Get the proof of work by json.

##### Parameters

none

##### Returns

`Object`:

- `Object` - *block_header*, Object of block header.
  - `Integer` - *version*, version of block.
  - `Integer` - *height*, height of block.
  - `String` - *previous_block_hash*, previous block hash.
  - `Integer` - *timestamp*, timestamp of block.
  - `Integer` - *nonce*, nonce value.
  - `Integer` - *bits*, bits of difficulty.
  - `Object` - *block_commitment*, Object of block commitment.
    - `String` - *transaction_merkle_root*, merkle root of transaction.
    - `String` - *transaction_status_hash*, merkle root of transaction status.
- `String` - *seed*, seed.

##### Example

```ruby
bytom_client.work.get_work_json
# response data
{  
   "status"   =>"success",
   "data"   =>   {  
      "block_header"      =>      {  
         "version"         =>1,
         "height"         =>119258,
         "previous_block_hash"         =>"d459ad431406704cffe9f41d6c5170185da780d64f04fa11f3e11cb5b13c8c68",
         "timestamp"         =>1547720937,
         "nonce"         =>0,
         "bits"         =>2161727821144505872,
         "block_commitment"         =>         {  
            "transaction_merkle_root"            =>"874e4cffc9fa1e09bf38c8f8bc27c0791e1644818af511bd2c886f5981f41027",
            "transaction_status_hash"            =>"c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc"
         }
      },
      "seed"      =>"be00f0b385475ea5578060b76e6bd4186468e797049f673580de3d7855500f21"
   }
}
```

----

#### `submit-work-json`

Submit the proof of work by json.

##### Parameters

`Object`:

- `Object` - *block_header*, Object of block header.
  - `Integer` - *version*, version of block.
  - `Integer` - *height*, height of block.
  - `String` - *previous_block_hash*, previous block hash.
  - `Integer` - *timestamp*, timestamp of block.
  - `Integer` - *nonce*, nonce value.
  - `Integer` - *bits*, bits of difficulty.
  - `Object` - *block_commitment*, Object of block commitment.
    - `String` - *transaction_merkle_root*, merkle root of transaction.
    - `String` - *transaction_status_hash*, merkle root of transaction status.

##### Returns

true if success

##### Example

```ruby
bytom_client.work.submit_work_json(
    block_header: {
        version: 1,
        height: 119258,
        previous_block_hash: "d459ad431406704cffe9f41d6c5170185da780d64f04fa11f3e11cb5b13c8c68",
        timestamp: 1547720937,
        nonce: 0,
        bits: 2161727821144505872,
        block_commitment: {
            transaction_merkle_root: "874e4cffc9fa1e09bf38c8f8bc27c0791e1644818af511bd2c886f5981f41027",
            transaction_status_hash: "c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc"
        }
    }
)

# Request
curl -X POST submit-work-json -d '{"block_header":{"version":1,"height":62960,"previous_block_hash":"dabdb926f8635791ac43f5d5fc62a4597e10e140f00aced3af621a77ead4e9fd","timestamp":1533006396,"nonce":0,"bits":2017612633069711400,"block_commitment":{"transaction_merkle_root":"a13fc86af3852ab73e30c3ae30e8cedbe990560a3c0f20dc37c4c14562b94802","transaction_status_hash":"c9c377e5192668bc0a367e4a4764f11e7c725ecced1d7b6a492974fab1b6d5bc"}}}'

# Response data
true / error
```
