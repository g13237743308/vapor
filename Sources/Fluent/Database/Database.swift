import Async
import Dispatch

/// Types conforming to this protocol can be used as
/// a database for Fluent connections and connection pools.
public protocol Database {
    /// Creates a new database connection that will
    /// execute callbacks on the supplied dispatch queue.
    func makeConnection(
        on queue: DispatchQueue
    ) -> Future<DatabaseConnection>
}

extension Database {
    /// Create a fluent connection pool for this database.
    public func makeConnectionPool(max: UInt, on queue: DispatchQueue) -> DatabaseConnectionPool {
        return DatabaseConnectionPool(max: max, database: self, queue: queue)
    }
}

