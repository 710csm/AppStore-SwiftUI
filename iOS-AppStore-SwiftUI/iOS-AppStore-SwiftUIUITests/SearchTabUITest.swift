//
//  SearchTabUITest.swift
//  iOS-AppStore-SwiftUIUITests
//
//  Created by 최승명 on 8/7/24.
//

import XCTest

final class SearchTabUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testSearchProcess() throws {
        let app = XCUIApplication()
        app.launch()

        // 검색 탭을 찾아서 이동
        let searchTab = app.tabBars.buttons["검색"]
        searchTab.tap()
        
        // 검색창을 찾아 텍스트 필드 터치 후 "Kakao" 입력
        let searchField = app.searchFields.firstMatch
        searchField.tap()
        searchField.typeText("Kakao")
        
        // 검색어 입력 후 키보드의 검색 버튼 터치
        let searchButton = app.buttons["search"] // "search" 또는 "검색"
        if !searchButton.exists {
            let searchKoreanButton = app.buttons["검색"]
            searchKoreanButton.tap()
        } else {
            searchButton.tap()
        }
        
        sleep(2)
        
        // 위, 아래로 스크롤
        app.swipeUp()
        sleep(1)
        app.swipeDown()
        
        // 검색 결과에서 첫번째 아이템을 선택
        let cell = app.collectionViews["searchResultList"].cells.element(boundBy: 0).buttons.firstMatch
        cell.tap()
        
        sleep(2)
        
        // 아래로 스크롤
        app.swipeUp()
        app.swipeUp()
        
        // 뒤로가기 버튼 탭
        let goBackButton = app.navigationBars.buttons.firstMatch
        goBackButton.tap()
        
        // 검색창의 취소 버튼 탭
        let cancelButton = app.navigationBars.buttons["취소"] // "Cancel" 또는 "취소"
        cancelButton.tap()
    }
}
