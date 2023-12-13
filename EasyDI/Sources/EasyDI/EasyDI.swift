import Foundation

@propertyWrapper
public struct Inject<T> {
    
    public var wrappedValue: T
    
    public init() {
        wrappedValue = Resolver.shared.resolve()
    }
}

public class Resolver {
    
    private var storage = [String: AnyObject]()
    private var factoryStorage = [String: () -> AnyObject]()
    
    public static let shared = Resolver()
    
    private init() {}
    
    public func add<T>(_ injectable: T, keyReplace: String? = nil) {
        let key = keyReplace ?? String(reflecting: injectable)
        storage[key] = injectable as AnyObject
    }
    
    public func addFactory<T: AnyObject>(_ injectable: @escaping () -> T, keyReplace: String? = nil) {
        let key = keyReplace ?? String(reflecting: injectable)
        factoryStorage[key] = injectable
    }

    public func resolve<T>() -> T {
        let key = String(reflecting: T.self)
        
        if let injectable = storage[key] as? T {
            return injectable
        } else if let factory = factoryStorage[key] {
            if let injectable = factory() as? T {
                return injectable
            } else {
                fatalError("\(key) has not been added as a dependency.")
            }
        }
        
        fatalError("\(key) has not been added as a dependency.")
    }
    
    public func cleanDependencies() {
        self.storage.removeAll()
        self.factoryStorage.removeAll()
    }
}
