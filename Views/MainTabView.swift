//
//  MainTabView.swift
//  73app-mid
//
//  Created by Ray Hsu on 2026/3/16.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(\.modelContext) private var modelContext
    @AppStorage("userColorScheme") private var userColorScheme: String = "system"
    @State private var viewModel = MileageViewModel()
    
    var preferredColorScheme: ColorScheme? {
        switch userColorScheme {
        case "light": return .light
        case "dark": return .dark
        default: return nil
        }
    }
    
    var body: some View {
        TabView {
            DashboardView(viewModel: viewModel)
                .tabItem {
                    Label("儀表板", systemImage: "gauge.with.dots.needle.bottom.50percent")
                }
            
            ProgressView(viewModel: viewModel)
                .tabItem {
                    Label("進度", systemImage: "chart.line.uptrend.xyaxis")
                }
            
            LedgerView(viewModel: viewModel)
                .tabItem {
                    Label("記帳", systemImage: "book.pages.fill")
                }
            
            SettingsView(viewModel: viewModel)
                .tabItem {
                    Label("設定", systemImage: "gearshape.fill")
                }
        }
        .tint(AviationTheme.Colors.cathayJade)
        .preferredColorScheme(preferredColorScheme)
        .onAppear {
            viewModel.initialize(context: modelContext)
        }
        .alert("儲存失敗", isPresented: $viewModel.showSaveError) {
            Button("確定", role: .cancel) {}
        } message: {
            Text(viewModel.saveError ?? "未知錯誤")
        }
    }
}

#Preview {
    MainTabView()
        .modelContainer(for: [MileageAccount.self, Transaction.self, FlightGoal.self, CreditCardRule.self])
}
