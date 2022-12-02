//
// SI Lab, 2022
//

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
