이더리움 실행환경 구축 (For Windows)
-------------------
[소스 공식 사이트] (https://github.com/ethereum/go-ethereum)



## 1. 실행 환경 구축
[인스톨 가이드] (https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum)

[인스톨없이 바로 설치] (https://geth.ethereum.org/downloads/)


## 2. 초기 접속 네트워크 선택
[geth 실행]  (https://github.com/ethereum/go-ethereum#running-geth)

[geth 커맨드 명령어] (https://github.com/ethereum/go-ethereum/wiki/Command-Line-Options)

### Main Network 접속
“`
geth --datadir="D:\Ethereum\storage\Main" --fast --cache=512 console
“`

+ 데이터 폴더를 메인드라이브 쓰는 경우 블럭체인 용량이 커질수록 부담이 됩니다. 
 (--datadir) data 폴더를 디폴트 드라이브(HOME\AppData\Ethash, HOME\AppData\Roaming\Ethereum) 가 아닌 다른 하드디스크 폴더로  변경합니다.
 
+ 빠른 동기화 모드 (- fast)로 시작하여 CPU 사용량이 많은 Ethereum 네트워크의 전체 기록 처리를 피하면서 더 많은 데이터를 다운로드합니다.

+ 데이터베이스의 메모리 허용량을 512MB (- cache = 512)로 늘리면 특히 HDD 사용자의 동기화 시간이 크게 단축됩니다. 이 플래그는 선택 사항이며 512MB ~ 2GB 범위를 권장하지만 원하는대로 높이거나 낮게 설정할 수 있습니다.

+ Geth의 내장 된 대화식 JavaScript 콘솔을 시작합니다 (Geth의 자체 관리 API는 물론 모든 공식 web3 메소드를 호출 할 수있는 콘솔 부속 명령을 통해). 이것 역시 선택 사항이며 생략하면 geth attach로 이미 실행중인 Geth 인스턴스에 연결할 수 있습니다.

###  Test Network 접속
“`
geth --datadir="D:\Ethereum\storage\Dev"  --testnet --fast --cache=512 console
“`

+ 개발자를 위해 실제 돈을 들이지 않고  Ethereum Contract를 생성하고 테스트 해보고 싶다면 (--testnet) 옵션으로주 네트워크와 완전히 동등한 환경의   테스트 네트워크에 합류가능합니다.

### Private Network 접속
“`geth --datadir "D:\Ethereum\storage\Private" init  D:\Ethereum\storage\Private\genesis.json 
“`


이더리움 실행환경 구축 
-------------------
