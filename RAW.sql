Generate Table Definitions and SQLs

17 events found in contract CErc20Delegator:

    AccrueInterest
    Approval
    Borrow
    Failure
    LiquidateBorrow
    Mint
    NewAdmin
    NewComptroller
    NewImplementation
    NewMarketInterestRateModel
    NewPendingAdmin
    NewReserveFactor
    Redeem
    RepayBorrow
    ReservesAdded
    ReservesReduced
    Transfer

50 functions found in contract CErc20Delegator:

    _acceptAdmin
    _addReserves
    _reduceReserves
    _setComptroller
    _setImplementation
    _setInterestRateModel
    _setPendingAdmin
    _setReserveFactor
    accrualBlockNumber
    accrueInterest
    admin
    allowance
    approve
    balanceOf
    balanceOfUnderlying
    borrow
    borrowBalanceCurrent
    borrowBalanceStored
    borrowIndex
    borrowRatePerBlock
    comptroller
    decimals
    delegateToImplementation
    delegateToViewImplementation
    exchangeRateCurrent
    exchangeRateStored
    getAccountSnapshot
    getCash
    implementation
    interestRateModel
    isCToken
    liquidateBorrow
    mint
    name
    pendingAdmin
    redeem
    redeemUnderlying
    repayBorrow
    repayBorrowBehalf
    reserveFactorMantissa
    seize
    supplyRatePerBlock
    symbol
    totalBorrows
    totalBorrowsCurrent
    totalReserves
    totalSupply
    transfer
    transferFrom
    underlying

Dataset Name
For Blockchain-ETL
Contract Name
AccrueInterest


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`cashPrior` STRING, `interestAccumulated` STRING, `borrowIndex` STRING, `totalBorrows` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "uint256", "name": "cashPrior", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "interestAccumulated", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "borrowIndex", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "totalBorrows", "type": "uint256"}], "name": "AccrueInterest", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x4dec04e750ca11537cabcd8a9eab06494de08da3735bc8871cd41250e190bc04'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.cashPrior AS `cashPrior`
    ,parsed.interestAccumulated AS `interestAccumulated`
    ,parsed.borrowIndex AS `borrowIndex`
    ,parsed.totalBorrows AS `totalBorrows`
FROM parsed_logs

Approval


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`owner` STRING, `spender` STRING, `amount` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": true, "internalType": "address", "name": "owner", "type": "address"}, {"indexed": true, "internalType": "address", "name": "spender", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "amount", "type": "uint256"}], "name": "Approval", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.owner AS `owner`
    ,parsed.spender AS `spender`
    ,parsed.amount AS `amount`
FROM parsed_logs

Borrow


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`borrower` STRING, `borrowAmount` STRING, `accountBorrows` STRING, `totalBorrows` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "borrower", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "borrowAmount", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "accountBorrows", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "totalBorrows", "type": "uint256"}], "name": "Borrow", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x13ed6866d4e1ee6da46f845c46d7e54120883d75c5ea9a2dacc1c4ca8984ab80'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.borrower AS `borrower`
    ,parsed.borrowAmount AS `borrowAmount`
    ,parsed.accountBorrows AS `accountBorrows`
    ,parsed.totalBorrows AS `totalBorrows`
FROM parsed_logs

Failure


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`error` STRING, `info` STRING, `detail` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "uint256", "name": "error", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "info", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "detail", "type": "uint256"}], "name": "Failure", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x45b96fe442630264581b197e84bbada861235052c5a1aadfff9ea4e40a969aa0'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.error AS `error`
    ,parsed.info AS `info`
    ,parsed.detail AS `detail`
FROM parsed_logs

LiquidateBorrow


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`liquidator` STRING, `borrower` STRING, `repayAmount` STRING, `cTokenCollateral` STRING, `seizeTokens` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "liquidator", "type": "address"}, {"indexed": false, "internalType": "address", "name": "borrower", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "repayAmount", "type": "uint256"}, {"indexed": false, "internalType": "address", "name": "cTokenCollateral", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "seizeTokens", "type": "uint256"}], "name": "LiquidateBorrow", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x298637f684da70674f26509b10f07ec2fbc77a335ab1e7d6215a4b2484d8bb52'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.liquidator AS `liquidator`
    ,parsed.borrower AS `borrower`
    ,parsed.repayAmount AS `repayAmount`
    ,parsed.cTokenCollateral AS `cTokenCollateral`
    ,parsed.seizeTokens AS `seizeTokens`
FROM parsed_logs

Mint


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`minter` STRING, `mintAmount` STRING, `mintTokens` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "minter", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "mintAmount", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "mintTokens", "type": "uint256"}], "name": "Mint", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x4c209b5fc8ad50758f13e2e1088ba56a560dff690a1c6fef26394f4c03821c4f'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.minter AS `minter`
    ,parsed.mintAmount AS `mintAmount`
    ,parsed.mintTokens AS `mintTokens`
FROM parsed_logs

NewAdmin


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`oldAdmin` STRING, `newAdmin` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "oldAdmin", "type": "address"}, {"indexed": false, "internalType": "address", "name": "newAdmin", "type": "address"}], "name": "NewAdmin", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xf9ffabca9c8276e99321725bcb43fb076a6c66a54b7f21c4e8146d8519b417dc'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.oldAdmin AS `oldAdmin`
    ,parsed.newAdmin AS `newAdmin`
FROM parsed_logs

NewComptroller


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`oldComptroller` STRING, `newComptroller` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "contract ComptrollerInterface", "name": "oldComptroller", "type": "address"}, {"indexed": false, "internalType": "contract ComptrollerInterface", "name": "newComptroller", "type": "address"}], "name": "NewComptroller", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x7ac369dbd14fa5ea3f473ed67cc9d598964a77501540ba6751eb0b3decf5870d'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.oldComptroller AS `oldComptroller`
    ,parsed.newComptroller AS `newComptroller`
FROM parsed_logs

NewImplementation


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`oldImplementation` STRING, `newImplementation` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "oldImplementation", "type": "address"}, {"indexed": false, "internalType": "address", "name": "newImplementation", "type": "address"}], "name": "NewImplementation", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xd604de94d45953f9138079ec1b82d533cb2160c906d1076d1f7ed54befbca97a'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.oldImplementation AS `oldImplementation`
    ,parsed.newImplementation AS `newImplementation`
FROM parsed_logs

NewMarketInterestRateModel


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`oldInterestRateModel` STRING, `newInterestRateModel` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "contract InterestRateModel", "name": "oldInterestRateModel", "type": "address"}, {"indexed": false, "internalType": "contract InterestRateModel", "name": "newInterestRateModel", "type": "address"}], "name": "NewMarketInterestRateModel", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xedffc32e068c7c95dfd4bdfd5c4d939a084d6b11c4199eac8436ed234d72f926'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.oldInterestRateModel AS `oldInterestRateModel`
    ,parsed.newInterestRateModel AS `newInterestRateModel`
FROM parsed_logs

NewPendingAdmin


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`oldPendingAdmin` STRING, `newPendingAdmin` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "oldPendingAdmin", "type": "address"}, {"indexed": false, "internalType": "address", "name": "newPendingAdmin", "type": "address"}], "name": "NewPendingAdmin", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xca4f2f25d0898edd99413412fb94012f9e54ec8142f9b093e7720646a95b16a9'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.oldPendingAdmin AS `oldPendingAdmin`
    ,parsed.newPendingAdmin AS `newPendingAdmin`
FROM parsed_logs

NewReserveFactor


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`oldReserveFactorMantissa` STRING, `newReserveFactorMantissa` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "uint256", "name": "oldReserveFactorMantissa", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "newReserveFactorMantissa", "type": "uint256"}], "name": "NewReserveFactor", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xaaa68312e2ea9d50e16af5068410ab56e1a1fd06037b1a35664812c30f821460'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.oldReserveFactorMantissa AS `oldReserveFactorMantissa`
    ,parsed.newReserveFactorMantissa AS `newReserveFactorMantissa`
FROM parsed_logs

Redeem


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`redeemer` STRING, `redeemAmount` STRING, `redeemTokens` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "redeemer", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "redeemAmount", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "redeemTokens", "type": "uint256"}], "name": "Redeem", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xe5b754fb1abb7f01b499791d0b820ae3b6af3424ac1c59768edb53f4ec31a929'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.redeemer AS `redeemer`
    ,parsed.redeemAmount AS `redeemAmount`
    ,parsed.redeemTokens AS `redeemTokens`
FROM parsed_logs

RepayBorrow


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`payer` STRING, `borrower` STRING, `repayAmount` STRING, `accountBorrows` STRING, `totalBorrows` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "payer", "type": "address"}, {"indexed": false, "internalType": "address", "name": "borrower", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "repayAmount", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "accountBorrows", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "totalBorrows", "type": "uint256"}], "name": "RepayBorrow", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x1a2a22cb034d26d1854bdc6666a5b91fe25efbbb5dcad3b0355478d6f5c362a1'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.payer AS `payer`
    ,parsed.borrower AS `borrower`
    ,parsed.repayAmount AS `repayAmount`
    ,parsed.accountBorrows AS `accountBorrows`
    ,parsed.totalBorrows AS `totalBorrows`
FROM parsed_logs

ReservesAdded


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`benefactor` STRING, `addAmount` STRING, `newTotalReserves` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "benefactor", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "addAmount", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "newTotalReserves", "type": "uint256"}], "name": "ReservesAdded", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xa91e67c5ea634cd43a12c5a482724b03de01e85ca68702a53d0c2f45cb7c1dc5'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.benefactor AS `benefactor`
    ,parsed.addAmount AS `addAmount`
    ,parsed.newTotalReserves AS `newTotalReserves`
FROM parsed_logs

ReservesReduced


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`admin` STRING, `reduceAmount` STRING, `newTotalReserves` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": false, "internalType": "address", "name": "admin", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "reduceAmount", "type": "uint256"}, {"indexed": false, "internalType": "uint256", "name": "newTotalReserves", "type": "uint256"}], "name": "ReservesReduced", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0x3bad0c59cf2f06e7314077049f48a93578cd16f5ef92329f1dab1420a99c177e'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.admin AS `admin`
    ,parsed.reduceAmount AS `reduceAmount`
    ,parsed.newTotalReserves AS `newTotalReserves`
FROM parsed_logs

Transfer


CREATE TEMP FUNCTION
  PARSE_LOG(data STRING, topics ARRAY<STRING>)
  RETURNS STRUCT<`from` STRING, `to` STRING, `amount` STRING>
  LANGUAGE js AS """
    var parsedEvent = {"anonymous": false, "inputs": [{"indexed": true, "internalType": "address", "name": "from", "type": "address"}, {"indexed": true, "internalType": "address", "name": "to", "type": "address"}, {"indexed": false, "internalType": "uint256", "name": "amount", "type": "uint256"}], "name": "Transfer", "type": "event"}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

WITH parsed_logs AS
(SELECT
    logs.block_timestamp AS block_timestamp
    ,logs.block_number AS block_number
    ,logs.transaction_hash AS transaction_hash
    ,logs.log_index AS log_index
    ,PARSE_LOG(logs.data, logs.topics) AS parsed
FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
WHERE address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND topics[SAFE_OFFSET(0)] = '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef'
)
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,log_index
    ,parsed.from AS `from`
    ,parsed.to AS `to`
    ,parsed.amount AS `amount`
FROM parsed_logs

_acceptAdmin


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [], "name": "_acceptAdmin", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xe9c714f2')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

_addReserves


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`addAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "addAmount", "type": "uint256"}], "name": "_addReserves", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x3e941010')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.addAmount AS `addAmount`
    
FROM parsed_traces

_reduceReserves


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`reduceAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "reduceAmount", "type": "uint256"}], "name": "_reduceReserves", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x601a0bf1')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.reduceAmount AS `reduceAmount`
    
FROM parsed_traces

_setComptroller


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`newComptroller` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "contract ComptrollerInterface", "name": "newComptroller", "type": "address"}], "name": "_setComptroller", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x4576b5db')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.newComptroller AS `newComptroller`
    
FROM parsed_traces

_setImplementation


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`implementation_` STRING, `allowResign` STRING, `becomeImplementationData` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "implementation_", "type": "address"}, {"internalType": "bool", "name": "allowResign", "type": "bool"}, {"internalType": "bytes", "name": "becomeImplementationData", "type": "bytes"}], "name": "_setImplementation", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x555bcc40')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.implementation_ AS `implementation_`
    
    ,parsed.allowResign AS `allowResign`
    
    ,parsed.becomeImplementationData AS `becomeImplementationData`
    
FROM parsed_traces

_setInterestRateModel


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`newInterestRateModel` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "contract InterestRateModel", "name": "newInterestRateModel", "type": "address"}], "name": "_setInterestRateModel", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xf2b3abbd')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.newInterestRateModel AS `newInterestRateModel`
    
FROM parsed_traces

_setPendingAdmin


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`newPendingAdmin` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address payable", "name": "newPendingAdmin", "type": "address"}], "name": "_setPendingAdmin", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xb71d1a0c')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.newPendingAdmin AS `newPendingAdmin`
    
FROM parsed_traces

_setReserveFactor


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`newReserveFactorMantissa` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "newReserveFactorMantissa", "type": "uint256"}], "name": "_setReserveFactor", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xfca7820b')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.newReserveFactorMantissa AS `newReserveFactorMantissa`
    
FROM parsed_traces

accrualBlockNumber


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "accrualBlockNumber", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x6c540baf')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

accrueInterest


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [], "name": "accrueInterest", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xa6afed95')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

admin


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "admin", "outputs": [{"internalType": "address payable", "name": "", "type": "address"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xf851a440')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

allowance


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`owner` STRING, `spender` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [{"internalType": "address", "name": "owner", "type": "address"}, {"internalType": "address", "name": "spender", "type": "address"}], "name": "allowance", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xdd62ed3e')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.owner AS `owner`
    
    ,parsed.spender AS `spender`
    
FROM parsed_traces

approve


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`spender` STRING, `amount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {"internalType": "uint256", "name": "amount", "type": "uint256"}], "name": "approve", "outputs": [{"internalType": "bool", "name": "", "type": "bool"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x095ea7b3')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.spender AS `spender`
    
    ,parsed.amount AS `amount`
    
FROM parsed_traces

balanceOf


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`owner` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [{"internalType": "address", "name": "owner", "type": "address"}], "name": "balanceOf", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x70a08231')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.owner AS `owner`
    
FROM parsed_traces

balanceOfUnderlying


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`owner` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "owner", "type": "address"}], "name": "balanceOfUnderlying", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x3af9e669')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.owner AS `owner`
    
FROM parsed_traces

borrow


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`borrowAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "borrowAmount", "type": "uint256"}], "name": "borrow", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xc5ebeaec')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.borrowAmount AS `borrowAmount`
    
FROM parsed_traces

borrowBalanceCurrent


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`account` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "account", "type": "address"}], "name": "borrowBalanceCurrent", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x17bfdfbc')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.account AS `account`
    
FROM parsed_traces

borrowBalanceStored


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`account` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [{"internalType": "address", "name": "account", "type": "address"}], "name": "borrowBalanceStored", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x95dd9193')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.account AS `account`
    
FROM parsed_traces

borrowIndex


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "borrowIndex", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xaa5af0fd')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

borrowRatePerBlock


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "borrowRatePerBlock", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xf8f9da28')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

comptroller


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "comptroller", "outputs": [{"internalType": "contract ComptrollerInterface", "name": "", "type": "address"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x5fe3b567')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

decimals


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "decimals", "outputs": [{"internalType": "uint8", "name": "", "type": "uint8"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x313ce567')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

delegateToImplementation


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`data` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "bytes", "name": "data", "type": "bytes"}], "name": "delegateToImplementation", "outputs": [{"internalType": "bytes", "name": "", "type": "bytes"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x0933c1ed')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.data AS `data`
    
FROM parsed_traces

delegateToViewImplementation


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`data` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [{"internalType": "bytes", "name": "data", "type": "bytes"}], "name": "delegateToViewImplementation", "outputs": [{"internalType": "bytes", "name": "", "type": "bytes"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x4487152f')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.data AS `data`
    
FROM parsed_traces

exchangeRateCurrent


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [], "name": "exchangeRateCurrent", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xbd6d894d')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

exchangeRateStored


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "exchangeRateStored", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x182df0f5')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

getAccountSnapshot


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`account` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [{"internalType": "address", "name": "account", "type": "address"}], "name": "getAccountSnapshot", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}, {"internalType": "uint256", "name": "", "type": "uint256"}, {"internalType": "uint256", "name": "", "type": "uint256"}, {"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xc37f68e2')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.account AS `account`
    
FROM parsed_traces

getCash


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "getCash", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x3b1d21a2')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

implementation


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "implementation", "outputs": [{"internalType": "address", "name": "", "type": "address"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x5c60da1b')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

interestRateModel


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "interestRateModel", "outputs": [{"internalType": "contract InterestRateModel", "name": "", "type": "address"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xf3fdb15a')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

isCToken


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "isCToken", "outputs": [{"internalType": "bool", "name": "", "type": "bool"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xfe9c44ae')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

liquidateBorrow


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`borrower` STRING, `repayAmount` STRING, `cTokenCollateral` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "borrower", "type": "address"}, {"internalType": "uint256", "name": "repayAmount", "type": "uint256"}, {"internalType": "contract CTokenInterface", "name": "cTokenCollateral", "type": "address"}], "name": "liquidateBorrow", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xf5e3c462')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.borrower AS `borrower`
    
    ,parsed.repayAmount AS `repayAmount`
    
    ,parsed.cTokenCollateral AS `cTokenCollateral`
    
FROM parsed_traces

mint


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`mintAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "mintAmount", "type": "uint256"}], "name": "mint", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xa0712d68')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.mintAmount AS `mintAmount`
    
FROM parsed_traces

name


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "name", "outputs": [{"internalType": "string", "name": "", "type": "string"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x06fdde03')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

pendingAdmin


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "pendingAdmin", "outputs": [{"internalType": "address payable", "name": "", "type": "address"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x26782247')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

redeem


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`redeemTokens` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "redeemTokens", "type": "uint256"}], "name": "redeem", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xdb006a75')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.redeemTokens AS `redeemTokens`
    
FROM parsed_traces

redeemUnderlying


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`redeemAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "redeemAmount", "type": "uint256"}], "name": "redeemUnderlying", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x852a12e3')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.redeemAmount AS `redeemAmount`
    
FROM parsed_traces

repayBorrow


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`repayAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "uint256", "name": "repayAmount", "type": "uint256"}], "name": "repayBorrow", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x0e752702')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.repayAmount AS `repayAmount`
    
FROM parsed_traces

repayBorrowBehalf


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`borrower` STRING, `repayAmount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "borrower", "type": "address"}, {"internalType": "uint256", "name": "repayAmount", "type": "uint256"}], "name": "repayBorrowBehalf", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x2608f818')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.borrower AS `borrower`
    
    ,parsed.repayAmount AS `repayAmount`
    
FROM parsed_traces

reserveFactorMantissa


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "reserveFactorMantissa", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x173b9904')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

seize


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`liquidator` STRING, `borrower` STRING, `seizeTokens` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "liquidator", "type": "address"}, {"internalType": "address", "name": "borrower", "type": "address"}, {"internalType": "uint256", "name": "seizeTokens", "type": "uint256"}], "name": "seize", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xb2a02ff1')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.liquidator AS `liquidator`
    
    ,parsed.borrower AS `borrower`
    
    ,parsed.seizeTokens AS `seizeTokens`
    
FROM parsed_traces

supplyRatePerBlock


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "supplyRatePerBlock", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xae9d70b0')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

symbol


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "symbol", "outputs": [{"internalType": "string", "name": "", "type": "string"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x95d89b41')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

totalBorrows


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "totalBorrows", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x47bd3718')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

totalBorrowsCurrent


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [], "name": "totalBorrowsCurrent", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x73acee98')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

totalReserves


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "totalReserves", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x8f840ddd')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

totalSupply


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "totalSupply", "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x18160ddd')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces

transfer


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`dst` STRING, `amount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "dst", "type": "address"}, {"internalType": "uint256", "name": "amount", "type": "uint256"}], "name": "transfer", "outputs": [{"internalType": "bool", "name": "", "type": "bool"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0xa9059cbb')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.dst AS `dst`
    
    ,parsed.amount AS `amount`
    
FROM parsed_traces

transferFrom


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<`src` STRING, `dst` STRING, `amount` STRING, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": false, "inputs": [{"internalType": "address", "name": "src", "type": "address"}, {"internalType": "address", "name": "dst", "type": "address"}, {"internalType": "uint256", "name": "amount", "type": "uint256"}], "name": "transferFrom", "outputs": [{"internalType": "bool", "name": "", "type": "bool"}], "payable": false, "stateMutability": "nonpayable", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x23b872dd')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
    ,parsed.src AS `src`
    
    ,parsed.dst AS `dst`
    
    ,parsed.amount AS `amount`
    
FROM parsed_traces

underlying


CREATE TEMP FUNCTION
    PARSE_TRACE(data STRING)
    RETURNS STRUCT<, error STRING>
    LANGUAGE js AS """
    var abi = {"constant": true, "inputs": [], "name": "underlying", "outputs": [{"internalType": "address", "name": "", "type": "address"}], "payable": false, "stateMutability": "view", "type": "function"};
    var interface_instance = new ethers.utils.Interface([abi]);

    var result = {};
    try {
        var parsedTransaction = interface_instance.parseTransaction({data: data});
        var parsedArgs = parsedTransaction.args;

        if (parsedArgs && parsedArgs.length >= abi.inputs.length) {
            for (var i = 0; i < abi.inputs.length; i++) {
                var paramName = abi.inputs[i].name;
                var paramValue = parsedArgs[i];
                if (abi.inputs[i].type === 'address' && typeof paramValue === 'string') {
                    // For consistency all addresses are lowercase.
                    paramValue = paramValue.toLowerCase();
                }
                result[paramName] = paramValue;
            }
        } else {
            result['error'] = 'Parsed transaction args is empty or has too few values.';
        }
    } catch (e) {
        result['error'] = e.message;
    }

    return result;
"""
OPTIONS
  ( library="gs://blockchain-etl-bigquery/ethers.js" );

WITH parsed_traces AS
(SELECT
    traces.block_timestamp AS block_timestamp
    ,traces.block_number AS block_number
    ,traces.transaction_hash AS transaction_hash
    ,traces.trace_address AS trace_address
    ,PARSE_TRACE(traces.input) AS parsed
FROM `bigquery-public-data.crypto_ethereum.traces` AS traces
WHERE to_address = '0x903560b1cce601794c584f58898da8a8b789fc5d'
  AND STARTS_WITH(traces.input, '0x6f307dc3')
  )
SELECT
     block_timestamp
     ,block_number
     ,transaction_hash
     ,trace_address
     ,parsed.error AS error
     
FROM parsed_traces