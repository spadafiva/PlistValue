struct PlistValue<T>{
    let value: T
    
    init(key: String, inPlist: String = "Keys") throws {
        guard let path = Bundle.main.path(forResource: "Keys",
                                          ofType: "plist") else {
                                            
            throw PlistValueError.noListAtPath
        }
        
        guard let keyDict = NSDictionary(contentsOfFile: path) else {
            throw PlistValueError.incorrectFormat
        }
        
        guard let value = keyDict[key] as? T else {
            throw PlistValueError.noValueAtKey(key: key)
        }
        
        self.value = value
    }
}


enum PlistValueError: Error {
    case noListAtPath
    case incorrectFormat
    case noValueAtKey(key: String)
}
