import SwiftUI
import SwiftData

@main
struct MileryApp: App {
    let sharedModelContainer: ModelContainer
    
    init() {
        let schema = Schema([
            MileageAccount.self,
            Transaction.self,
            FlightGoal.self,
            CreditCardRule.self,
            RedeemedTicket.self
        ])
        
        let syncEnabled = UserDefaults.standard.object(forKey: "cloudKitSyncEnabled") as? Bool ?? true
        
        if syncEnabled, let container = Self.makeCloudKitContainer(schema: schema) {
            sharedModelContainer = container
            print("[Milery] CloudKit 同步已啟用")
        } else if let container = Self.makeLocalContainer(schema: schema) {
            sharedModelContainer = container
            print("[Milery] 本地模式（CloudKit 同步已關閉或不可用）")
        } else {
            fatalError("[Milery] 無法建立任何資料庫")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    // MARK: - CloudKit 同步容器
    
    private static func makeCloudKitContainer(schema: Schema) -> ModelContainer? {
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .automatic
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            print("[Milery] CloudKit ModelContainer 建立失敗: \(error)")
            return nil
        }
    }
    
    // MARK: - 純本地容器（fallback）
    
    private static func makeLocalContainer(schema: Schema) -> ModelContainer? {
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .none
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            print("[Milery] Local ModelContainer 建立失敗: \(error)")
            return nil
        }
    }
}
