이더리움 실행환경 구축 (For Windows)
=============
[소스 공식 사이트](github.com/ethereum/go-ethereum)

| 종류  | 사양 |
| ------------- | ------------- |
| OS  | Window7 64bit  |
| go-ethereum version  | v1.7.0 |
| source path | D:\Ethereum\src |
| data path | D:\Ethereum\storage\Main( or Dev or Private) |


## 실행 환경 구축
[인스톨 가이드](github.com/ethereum/go-ethereum/wiki/Building-Ethereum)

[인스톨없이 바로 설치할 경우,](geth.ethereum.org/downloads/)

## 초기 접속 네트워크 선택
[geth 실행](github.com/ethereum/go-ethereum#running-geth)

Main Network(메인), Test Network(테스트), Private Network(사설) 3가지 네트워크중 하나를 선택할 수 있습니다. 
개발자용 사설망 환경으로 테스트하기 위해서는 3) 번으로  바로 이동합니다.


#### 3) Private Network 접속

**1단계: genesis파일을 이용하여 블록 생성**

`$ geth --datadir "D:\Ethereum\storage\Private" init  D:\Ethereum\storage\Private\genesis.json 
`

+ **init** : 별도의 사설망을 구축하기 위해 genesis.json파일을 만들어 생성가능하다
(이전 버전에서는 --genesis로 설정가능했으나 최신 버전에서는 init으로 변경되었다.)

> D:\Ethereum\storage\Private\genesis.json 예시
```

{
  "config": {
        "chainId": 0,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },

  "alloc"      : {},
  "coinbase"   : "0x0000000000000000000000000000000000000000",
  "difficulty" : "0x20000",
  "extraData"  : "",
  "gasLimit"   : "0x2fefd8",
  "nonce"      : "0x0000000000000042",
  "mixhash"    : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp"  : "0x00"
}

```
NOTICE : 사설명이 성공적으로 생성되면 'WARN : No etherbase set and no accounts found as default' 경고가 발생하는데, 
이는 아직 생성된 계정 생성 없기 때문입니다(아래 계속 진행). 


**2단계 : 이더리움을 구동하여 계정 생성** 

init는 console 명령과 함께 쓸 수 없으므로 genesis.json으로 생성한 노드에 접속하여
계정을 두개 생성합니다. (console을 이미 사용중일 경우, 'attach'로 접속 가능 합니다.)
```
$ geth --datadir "D:\Ethereum\storage\Private" console

> personal.newAccount()
Passphrase : 
Repeat passphrase : 
"0x0000000000000000000000000000000000000001"

> personal.newAccount()
Passphrase : 
Repeat passphrase : 
"0x0000000000000000000000000000000000000002"
```

**3단계 : 기존 생성된 사설 블록 삭제**

일단 2개의 계정이 정상적으로 생성되면, keystore 폴더를 제외한 모든 폴더와 파일을 삭제 합니다. 
D:\Ethereum\storage\Private\geth 폴더와 D:\Ethereum\storage\Private\history 파일을 삭제합니다.
주의 : D:\Ethereum\storage\Private\keystore 폴더는 지우지 않습니다.


**4단계 : 잔액이 있는 계정으로 블록을 재생성** 

genesis.json 파일에 alloc 부분을 다음과 같이 수정합니다.

> D:\Ethereum\storage\Private\genesis.json 수정된 예시 *(alloc 부분 변경)*
```
{
  "config": {
        "chainId": 0,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },

  "alloc": {
    "0x0000000000000000000000000000000000000001": {"balance": "100000000000000000000000000000000000000000000000000"},
    "0x0000000000000000000000000000000000000002": {"balance": "200000000000000000000000000000000000000000000000000"}
  },
  "coinbase"   : "0x0000000000000000000000000000000000000000",
  "difficulty" : "0x20000",
  "extraData"  : "",
  "gasLimit"   : "0x2fefd8",
  "nonce"      : "0x0000000000000042",
  "mixhash"    : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp"  : "0x00"
}
```

> 수정된 genesis.json으로 init을 재실행하여 계정과 잔액을 확인해 봅니다.
```
$ geth --datadir "D:\Ethereum\storage\Private" init D:\Ethereum\storage\Private\genesis.json 
$ geth --datadir "D:\Ethereum\storage\Private" console
 > eth.accounts()
["0x0000000000000000000000000000000000000001", "0x0000000000000000000000000000000000000002"]
 > eth.coinbase
"0x0000000000000000000000000000000000000001"
```
NOTICE : 이때 coinbase(etherbase는) 최초 생성된 계정으로 자동으로 할당됩니다. 



[geth 커맨드 명령어](github.com/ethereum/go-ethereum/wiki/Command-Line-Options)

이더리움 실행환경 구축 
-------------------
