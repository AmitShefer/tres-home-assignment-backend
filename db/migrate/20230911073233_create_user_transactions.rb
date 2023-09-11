class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.integer :user_id
      t.string :txn_hash
      t.string :method
      t.string :from
      t.string :to
      t.decimal :value
      t.decimal :fee
      t.timestamp :date

      t.timestamps
    end

    create_dummy_transactions
  end

  def create_dummy_transactions
    transactions = [
      {
        txn_hash: '0x5f33f947ef33a1cf277138b87313a542eeab3e35ae74e4ecb79828d7e864894b',
        method: 'Transfer',
        from: '0xF50Ce77b2BAa1dbF79A10a916DB0Ea5aEFBc4d2f',
        to: '0xa27CEF8aF2B6575903b676e5644657FAe96F491F',
        value: 0.043456122,
        fee: 0.00022653,
        date: 'Sat, 08 Sep 2023 07:31:36.957035000 UTC +00:00',
      },
      {
        txn_hash: '0x1bc9a9cbf6bb83b47971eb0a1f6fca4f9a50a80ca357e7c9df10167802e3a764',
        method: 'Deposit',
        from: '0x878F5B2266DDFd55a9F7d5eCf51C970Ec5ba78f8',
        to: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
        value: 0.043456122,
        fee: 0.00022653,
        date: 'Sat, 09 Sep 2023 10:30:36.957035000 UTC +00:00',
      },
      {
        txn_hash: '0x66ad7218111477b7ab599216701a28e832a767c24daf4f3bc5c68f0c50e227f6',
        method: 'Execute',
        from: '0xD0105a4c3eee3600DfA269ff0a92f04FEFA1cc77',
        to: '0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD',
        value: 0.0,
        fee: 0.00212928,
        date: 'Sat, 09 Sep 2023 11:15:36.957035000 UTC +00:00',
      },
      {
        txn_hash: '0x5b6e2c0432126a27045b4c3e68b3736afef1ed93eb598599b05a43031c8d37ed',
        method: 'Transfer',
        from: '0x4838B106FCe9647Bdf1E7877BF73cE8B0BAD5f97',
        to: '0x388C818CA8B9251b393131C08a736A67ccB19297',
        value: 0.026254116,
        fee: 0.00019117,
        date: 'Sat, 10 Sep 2023 12:50:36.957035000 UTC +00:00',
      },
      {
        txn_hash: '0x4d1ffbd813dc4d71021568045006fb70c0d4637d473991ef3a61c2e7514259fd',
        method: 'Deposit',
        from: '0x236338250923B1FC538Ff612836305CcDD8eeA90',
        to: '0xae0Ee0A63A2cE6BaeEFFE56e7714FB4EFE48D419',
        value: 1.946499066,
        fee: 0.00101339,
        date: 'Sat, 09 Sep 2023 09:40:36.957035000 UTC +00:00',
      },
      {
        txn_hash: '0x5dbd695674fcf9433fec7f9b949bdb0062251eca0af8e59b9cb39a9beba2139b',
        method: 'Sell To Uniswap',
        from: '0x374B16FFdd9608678C721398bdA1AD709CFCC095',
        to: '0xDef1C0ded9bec7F1a1670819833240f027b25EfF',
        value: 0.0006153,
        fee: 0.00105335,
        date: 'Sat, 08 Sep 2023 15:20:36.957035000 UTC +00:00',
      },
      {
        txn_hash: '0x31927d6954a4d1753537a36ab64aae19e03a6aa351bcf639ef75d95a0b9f0525',
        method: 'Request L2Transaction',
        from: '0x3516CDF9CfE6331F7a7d7125a493024ae0136903',
        to: '0x32400084C286CF3E17e7B677ea9583e60a000324',
        value: 0.748934144,
        fee: 0.00755121,
        date: 'Sat, 10 Sep 2023 12:00:36.957035000 UTC +00:00',
      }
    ]

    transactions.each do |transaction|
      UserTransaction.create(transaction.merge(user_id: 1))
    end
  end
end
