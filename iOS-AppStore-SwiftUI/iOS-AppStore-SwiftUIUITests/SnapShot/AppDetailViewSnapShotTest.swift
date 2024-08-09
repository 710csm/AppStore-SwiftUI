//
//  AppDetailViewSnapShotTest.swift
//  iOS-AppStore-SwiftUIUITests
//
//  Created by 최승명 on 8/7/24.
//

import SwiftUI
import XCTest

import AppDetailKit
import SnapshotTesting

@testable import iOS_AppStore_SwiftUI

final class AppDetailViewSnapShotTest: XCTestCase {

    // MARK: - Test Setting
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    // MARK: - Test
    
    @MainActor
    func test_appDetailView_withMockData() async throws {
        // given
        let result = AppDetailDTO(
            trackId: 362057947,
            trackName: "카카오톡",
            description: "* 업데이트를 하기 전에 항상 폰 백업 혹은 '이메일 계정 연결', '친구목록 내보내기' 등으로 중요한 데이터를 보관하시기를 권장합니다.\n\n** 카카오톡은 무료 앱입니다. 업데이트 또는 앱 설치 과정에서 일부 사용자에게 보여지는 앱스토어 $1결제 관련 메시지는 실제로 비용이 청구되지 않습니다. 자세한 내용은 애플에 문의해주시기 바랍니다.\n================================\n카카오톡을 이용하면  푸쉬 기능을 통해  즉각적으로 메시지를 받을 수 있고  사진, 동영상, 연락처 등의 멀티미디어도 간편하게 주고 받을 수 있습니다. 이제 SMS에서 벗어나 카카오톡으로 친구, 동료, 가족들과 보다 편리하고 다양한 멀티미디어 채팅을 시작해 보세요.\n\n- 카카오톡의 주요 기능 -\n\n* 전세계 어디서나 무료로 즐기는 그룹채팅 및 1:1 채팅\n카카오톡을 설치한 친구들간에는 국내뿐 아니라 해외에 있는 친구들과도 무료로 채팅을 즐길 수 있습니다.  기본적인 1:1 채팅뿐 아니라,  그룹 채팅을 통해 여러 친구들과 동시에  메시지, 사진, 동영상, 음악, 연락처 등을 간편하게 주고 받을 수 있습니다. \n(카카오톡은 WIFI 또는 셀룰러 데이터를 이용합니다) \n\n*모임이 편리해지는 톡게시판\n모임 안내를 공지로 올리고, 일정과 투표로 더 쉽게 모여보세요. 게시판에 사진과 동영상, 파일을 올려두면 언제든지 찾아 볼 수 있습니다. \n\n*카톡하다 궁금할 때 #검색 \n카톡하다 궁금한게 생기면 따로 찾지말고 #검색으로 원하던 답을 한 눈에 찾아 보세요. \n\n*링크로 연결되는 오픈채팅\n친구 추가 없이 채팅하고 싶을 때 링크를 만들어서 대화할 수 있어요. 좋아하는 관심사나 스터디/모임으로 활용해 보세요. \n\n*전세계 어디서나 보이스톡, 뽀샤시한 얼굴로 페이스톡\n무제한 무료통화가 가능한 보이스톡으로 친구들과 이야기를 나누어 보세요. 페이스톡 영상통화는 감각적인 필터로 여러분의 얼굴을 더 아름답게 보여줄 수 있습니다. \n\n*카톡만 있다면 송금할 준비 끝 \n계좌번호, 공인인증서, OTP 없이 카톡 친구에게 메시지 보내 듯 쉽게 송금할 수 있습니다.\n\n*유용하고 안전한 주문, 배송, 결제 등의 정보성 메시지, 알림톡\n스팸 문자에 불편하고 스미싱 문자에 불안하셨나요? 대표전화에는 문자 회신 못해 답답하셨나요?\n주문/결제/예약 내역이나 배송현황과 같이 여러분에게 꼭 필요한 정보들은 카카오톡 채널 알림톡으로 보내 드립니다.\n\n*톡에서 하는 데이터 관리! 톡서랍\n매일 톡에서 주고받는 데이터를 자동으로 보관하고, 톡서랍 플러스에서 손쉽게 관리해보세요!\n\n[서비스 접근 권한 안내]\n* 선택 접근 권한\n- 위치정보 : 지도 기능 사용시 위치 정보 검색 및 위치 공유\n- 연락처 : 친구 추가 및 연락처, 프로필 전송\n- 사진 : 프로필, 채팅방에 사진 및 멀티미디어 파일 제공\n- 마이크 : 보이스톡,페이스톡, 라이브톡 통화 및 음성메시지 녹음\n- 카메라 : 친구추가를 위한 QR코드 촬영, 페이스톡 통화, 채팅방 멀티미디어 파일 제공, QR코드 인식, 카카오페이 신용카드 번호 인식 \n- 캘린더: 기기 캘린더의 일정 수정 및 등록\n\n* 선택 접근 권한은 동의하지 않아도 서비스 이용이 가능합니다.\n* 선택 접근 권한 미동의시 서비스 일부 기능의 정상적인 이용이 어려울 수 있습니다.\n\n* '카카오톡', '알림톡', '오픈채팅', '페이스톡' 등 카카오톡 애플리케이션에 표시된 다수의 서비스 명칭은 주식회사 카카오의 등록 상표 또는 상표입니다. 애플리케이션 내부에는 ® 및 TM 을 표시하지 않았습니다.",
            screenshotUrls: [
                URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/61/6f/b8/616fb8ac-770b-b488-1940-018a90be396b/62c3d928-00bd-41d6-961f-3e91faabc09d_Kakaotalk_iOS_SC_KR_01.jpg/392x696bb.jpg")!,
                URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/7d/31/ea/7d31eab8-fe4a-abab-06cb-a0b54697244b/42139f84-92c5-4016-8609-7b10aa14b393_Kakaotalk_iOS_SC_KR_02.jpg/392x696bb.jpg")!,
                URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/dc/57/89/dc57891a-af48-6597-65f4-eac5a2bd7724/66f985c5-567f-403b-a6cf-df45f0af2497_Kakaotalk_iOS_SC_KR_03.jpg/392x696bb.jpg")!,
            ],
            releaseNotes: "[v10.9.3]\n• 버그 수정 및 안정성 개선\n\n[v10.9.0]\n• 키워드 알림 기능 추가\n• 채팅방 상단 고정 개수 10개로 확대\n• 톡게시판에서 한 게시글에 투표를 3개까지 추가할 수 있어요.\n• 실험실 기능 추가\n: 채팅목록에서 내가 작성 중인 메시지가 있는 채팅방을 확인할 수 있어요.\n• 펑 노출 시간 설정 기능 추가 \n• 이모티콘 스토어 홈 디자인 및 기능 개편",
            currentVersionReleaseDate: "2024-07-29T00:35:46Z",
            version: "10.9.3",
            artistName: "Kakao Corp.",
            genres: ["소셜 네트워킹", "생산성"],
            trackViewUrl: "https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1/id362057947?uo=4",
            contentAdvisoryRating: "4+",
            averageUserRating: 2.9919,
            userRatingCount: 138082,
            artworkUrl100: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/8a/6b/be/8a6bbe5d-1874-6827-d23f-d6c62998447d/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-85-220.png/100x100bb.jpg")!,
            fileSizeBytes: "465814528",
            languageCodesISO2A: ["EN", "FR", "DE", "KO", "VI"]
        )
        let view = AppDetailView(result: result)
        let hostingView = UIHostingController(rootView: view)
        
        // when
        
        // then
        assertSnapshot(of: hostingView, as: .image(on: .iPhone12Pro))
    }
}
