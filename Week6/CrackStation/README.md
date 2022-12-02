# CrackStation

> Author: Yupeng Qin, October 27,2022

## Why use CrackStation
* This library generates a hash table for you to verify your hash table. It might reduce your time to create the hash table. Default bits are up to 3 bits. You can generate more hash values by using. GenerateCrackStation.py

## How to use
* import in your package.swift

```
dependencies: [
        .package(url: "git@github.com:qinbatista/CrackStation.git", .upToNextMajor(from: "1.0.8"))
    ],
```
* call the functions from CrackStation

```
import CrackStation
public struct CrackStationWrapper: Decrypter {
    private let testObject: Decrypter

    public init() {
        testObject = CrackStation()
    }

    public func decrypt(shaHash: String) -> String? {
        let crackedPassword = testObject.decrypt(shaHash: shaHash)
        return crackedPassword
    }
}

```


## Table
### GenerateCrackStation.py
> This file will generate the SHA256 3 bits password of the table from a-z and 0-9. The table file will be generated in GenerateCrackStation.py's location.

 
#### How To Use
```
python3 GenerateCrackStation.py
```
#### The Table Content
```
{
    "a": "ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb",
    "b": "3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d",
    "c": "2e7d2c03a9507ae265ecf5b5356885a53393a2029d241394997265a1a25aefc6",
    ....
    "996": "3292bef42975c0ab63a2e9ab72143d6e2658dbd6e81a28cb9cf7618ff906c978",
    "997": "864995ea35b82212a9a2d456a3f89833f24651c4e5ebc21c18476a9afb065035",
    "998": "462c39f8e9bbf461369150222f7493055e67079106a1a721824544b113519bf3",
    "999": "83cf8b609de60036a8277bd0e96135751bbc07eb234256d4b65b893360651bf2"
}
```

#### Extra Info
- if you want to create more than 3 bits passwords. just add more loops at

```
for bit1 in self.__string_list:
    for bit2 in self.__string_list:
        for bit3 in self.__string_list:
			for ....
```
