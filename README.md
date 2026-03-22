# Milery: 航空哩程管理與目標追蹤系統

![iOS](https://img.shields.io/badge/iOS-26.0+-black?style=for-the-badge&logo=apple)
![Swift](https://img.shields.io/badge/Swift-Native-FA7343?style=for-the-badge&logo=swift)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Blue?style=for-the-badge&logo=swift)

## 專案概述

Milery是一款專為航空常客與哩程使用者開發之 iOS 原生應用程式。系統旨在透過視覺化介面與本地資料庫技術，協助使用者系統化地管理哩程資產、設定機票兌換目標，並將抽象的點數轉換為具體的飛行進度與 3D 航線空間視覺回饋。

## 應用程式取得方式

目前提供正式上架版本與Testflight測試版本，可透過以下管道取得：

* **App Store 正式版:** [Apple審核中]()
* **TestFlight 公測版:** [點此加入 TestFlight 測試計畫](https://testflight.apple.com/join/gWaMP1w2)

## 核心系統模組

* **哩程資產管理模組**
  提供結構化之資料輸入介面，精確記錄哩程之獲取、轉換與消耗。支援多源點數追蹤，確保帳務邏輯之完整性與正確性。
* **兌換目標追蹤系統**
  依據使用者設定之起訖點 (如TPE-KIX)，系統動態計算並以量化之進度條呈現機票兌換之完成度。
* **數位登機證生成器**
  於目標達成後，系統自動擷取航班資料、艙等與 IATA 機場代碼，生成具備視覺設計感之數位登機證憑證。
* **3D 航線視覺化模組**
  介接原生 MapKit 框架，於立體地球儀模型上渲染已兌換之飛行軌跡，提供直觀的空間資訊展示。

## 系統架構與技術端點

本專案基於 iOS 原生開發規範建置，以確保最佳之運行效能與系統整合度。

* **使用者介面設計:** `SwiftUI` (導入玻璃擬態 Glassmorphism 與深色模式設計規範)
* **本地資料持久化:** `SwiftData` (確保資料端到端之隱私性與高效率讀寫)
* **地理空間資訊處理:** `MapKit` 與 `CoreLocation` (實作座標轉換與 3D 地球儀渲染)
* **向量圖示系統:** `SF Symbols`

## 系統需求

* **作業系統:** iOS 26.0 或以上版本
* **開發環境:** 建議 Xcode 26.3 以上版本

## 安裝與執行指引

1. 複製本專案原始碼：`git clone https://github.com/111319022/milery.git`
2. 於 Xcode 環境中開啟 `milery.xcodeproj` 專案檔。
3. 選擇適當之模擬器或實機設備進行編譯與執行。

## 開發團隊

* **Raaay**: [https://github.com/111319022](https://github.com/111319022)
* **阿姿**: [https://github.com/mewneko-edu](https://github.com/mewneko-edu)

---
*本專案為「2026 餘73 的 跨平台APP設計」課程之期中*
