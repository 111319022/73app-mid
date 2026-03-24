import SwiftUI

struct ConsoleLogView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var console = AppConsoleStore.shared
    @State private var showingClearConfirm = false

    var body: some View {
        List {
            Section {
                HStack {
                    Label("總筆數", systemImage: "number")
                    Spacer()
                    Text("\(console.entries.count)")
                        .foregroundStyle(.secondary)
                }

                Button {
                    let text = console.entries.joined(separator: "\n")
                    UIPasteboard.general.string = text
                } label: {
                    Label("複製全部日誌", systemImage: "doc.on.doc")
                }

                Button(role: .destructive) {
                    showingClearConfirm = true
                } label: {
                    Label("清空日誌", systemImage: "trash")
                }
            }

            Section("日誌內容") {
                if console.entries.isEmpty {
                    Text("目前沒有可顯示的日誌")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(Array(console.entries.enumerated()), id: \.offset) { _, entry in
                        Text(entry)
                            .font(.system(.footnote, design: .monospaced))
                            .textSelection(.enabled)
                            .lineLimit(nil)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Console 日誌")
        .navigationBarTitleDisplayMode(.inline)
        .alert("清空日誌", isPresented: $showingClearConfirm) {
            Button("取消", role: .cancel) {}
            Button("清空", role: .destructive) {
                console.clear()
            }
        } message: {
            Text("確定要刪除所有 App 內日誌嗎？")
        }
    }
}

#Preview {
    NavigationStack {
        ConsoleLogView()
    }
}
