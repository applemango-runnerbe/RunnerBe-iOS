// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Birth {
    /// 정확한 나이는 공개되지 않아요!
    internal static let subTitle1 = L10n.tr("Localizable", "Birth.subTitle1")
    /// 20대 초반, 30대 중반 등으로 표기될 거에요.
    internal static let subTitle2 = L10n.tr("Localizable", "Birth.subTitle2")
    /// 출생년도를 입력해주세요.
    internal static let title = L10n.tr("Localizable", "Birth.title")
    internal enum NavBar {
      /// TITLE
      internal static let title = L10n.tr("Localizable", "Birth.NavBar.title")
    }
    internal enum Button {
      /// 다음
      internal static let next = L10n.tr("Localizable", "Birth.button.next")
    }
    internal enum Error {
      /// 19세 미만은 이용할 수 없어요!
      internal static let age = L10n.tr("Localizable", "Birth.error.age")
    }
  }

  internal enum EmailCertification {
    /// 해당 정보는 러너님이 직장임을 확인하는 용도로만
    internal static let subTitle1 = L10n.tr("Localizable", "EmailCertification.subTitle1")
    /// 사용되며, 외부에 공개되지 않습니다.
    internal static let subTitle2 = L10n.tr("Localizable", "EmailCertification.subTitle2")
    /// 회사 이메일로
    internal static let title1 = L10n.tr("Localizable", "EmailCertification.title1")
    /// 직장을 인증해주세요
    internal static let title2 = L10n.tr("Localizable", "EmailCertification.title2")
    internal enum Button {
      internal enum Certificate {
        /// 인증하기
        internal static let firstSend = L10n.tr("Localizable", "EmailCertification.Button.Certificate.firstSend")
        /// 재전송
        internal static let resend = L10n.tr("Localizable", "EmailCertification.Button.Certificate.resend")
      }
      internal enum NotHaveEmail {
        /// 회사 이메일이 없어요
        internal static let title = L10n.tr("Localizable", "EmailCertification.Button.NotHaveEmail.title")
      }
    }
    internal enum Message {
      /// 인증 링크가 발송되었어요
      internal static let mailSend1 = L10n.tr("Localizable", "EmailCertification.Message.MailSend1")
      /// 메일이 오지 않는다면 스팸 메일함도 확인해주세요!
      internal static let mailSend2 = L10n.tr("Localizable", "EmailCertification.Message.MailSend2")
    }
    internal enum Modal {
      internal enum Button {
        /// OK
        internal static let yes = L10n.tr("Localizable", "EmailCertification.Modal.Button.yes")
      }
      internal enum Message {
        /// 메일 인증은 현재 접속하신
        internal static let _1 = L10n.tr("Localizable", "EmailCertification.Modal.Message.1")
        /// 기기 내에서만 가능합니다!
        internal static let _2 = L10n.tr("Localizable", "EmailCertification.Modal.Message.2")
      }
    }
    internal enum NavBar {
      /// TITLE
      internal static let title = L10n.tr("Localizable", "EmailCertification.NavBar.title")
    }
    internal enum EmailField {
      /// runnerbee@company.com
      internal static let placeholder = L10n.tr("Localizable", "EmailCertification.emailField.placeholder")
    }
    internal enum Error {
      /// 이미 사용 중인 이메일이에요!
      internal static let duplicated = L10n.tr("Localizable", "EmailCertification.error.duplicated")
    }
  }

  internal enum Gender {
    /// 여성
    internal static let female = L10n.tr("Localizable", "Gender.female")
    /// 남성
    internal static let male = L10n.tr("Localizable", "Gender.male")
    /// 전체
    internal static let `none` = L10n.tr("Localizable", "Gender.none")
  }

  internal enum Home {
    internal enum Filter {
      internal enum Age {
        /// 모든연령
        internal static let all = L10n.tr("Localizable", "Home.Filter.Age.all")
        /// 연령
        internal static let title = L10n.tr("Localizable", "Home.Filter.Age.title")
      }
      internal enum Gender {
        /// 성별
        internal static let title = L10n.tr("Localizable", "Home.Filter.Gender.title")
      }
      internal enum Job {
        /// 직군
        internal static let title = L10n.tr("Localizable", "Home.Filter.Job.title")
      }
      internal enum NavBar {
        /// 필터
        internal static let title = L10n.tr("Localizable", "Home.Filter.NavBar.title")
      }
      internal enum Place {
        /// 모임장소
        internal static let title = L10n.tr("Localizable", "Home.Filter.Place.title")
      }
    }
  }

  internal enum Job {
    /// 재무/회계
    internal static let acc = L10n.tr("Localizable", "Job.ACC")
    /// CS
    internal static let cus = L10n.tr("Localizable", "Job.CUS")
    /// 디자인
    internal static let des = L10n.tr("Localizable", "Job.DES")
    /// 개발
    internal static let dev = L10n.tr("Localizable", "Job.DEV")
    /// 교육
    internal static let edu = L10n.tr("Localizable", "Job.EDU")
    /// 인사
    internal static let hur = L10n.tr("Localizable", "Job.HUR")
    /// 의료
    internal static let med = L10n.tr("Localizable", "Job.MED")
    /// 마케팅/PR
    internal static let mpr = L10n.tr("Localizable", "Job.MPR")
    /// 생산
    internal static let pro = L10n.tr("Localizable", "Job.PRO")
    /// 기획/전략/경영
    internal static let psm = L10n.tr("Localizable", "Job.PSM")
    /// 공무원
    internal static let psv = L10n.tr("Localizable", "Job.PSV")
    /// 연구
    internal static let res = L10n.tr("Localizable", "Job.RES")
    /// 영업/제휴
    internal static let saf = L10n.tr("Localizable", "Job.SAF")
    /// 서비스
    internal static let ser = L10n.tr("Localizable", "Job.SER")
  }

  internal enum LoggedOut {
    internal enum AppleBtn {
      /// Login with Apple
      internal static let text = L10n.tr("Localizable", "LoggedOut.AppleBtn.text")
    }
    internal enum KakaoBtn {
      /// Login with Kakao
      internal static let text = L10n.tr("Localizable", "LoggedOut.KakaoBtn.text")
    }
    internal enum NaverBtn {
      /// Login with Naver
      internal static let text = L10n.tr("Localizable", "LoggedOut.NaverBtn.text")
    }
  }

  internal enum MainTabbar {
    internal enum Item {
      internal enum BookMark {
        /// BookMark
        internal static let title = L10n.tr("Localizable", "MainTabbar.Item.BookMark.title")
      }
      internal enum Home {
        /// Home
        internal static let title = L10n.tr("Localizable", "MainTabbar.Item.Home.title")
      }
      internal enum Message {
        /// Message
        internal static let title = L10n.tr("Localizable", "MainTabbar.Item.Message.title")
      }
      internal enum MyPage {
        /// MyPage
        internal static let title = L10n.tr("Localizable", "MainTabbar.Item.MyPage.title")
      }
    }
  }

  internal enum NavBar {
    internal enum Right {
      internal enum First {
        /// 다음
        internal static let next = L10n.tr("Localizable", "NavBar.Right.First.next")
      }
    }
  }

  internal enum NickName {
    /// 한 번 정한 닉네임은 수정할 수 없어요.
    internal static let subtitle = L10n.tr("Localizable", "NickName.subtitle")
    /// 어떤 닉네임으로
    internal static let title1 = L10n.tr("Localizable", "NickName.title1")
    /// 활동하실 건가요?
    internal static let title2 = L10n.tr("Localizable", "NickName.title2")
    internal enum Button {
      internal enum CheckDup {
        /// 중복 확인
        internal static let title = L10n.tr("Localizable", "NickName.button.checkDup.title")
      }
      internal enum SetNickname {
        /// 정했어요!
        internal static let title = L10n.tr("Localizable", "NickName.button.setNickname.title")
      }
    }
    internal enum Error {
      /// 중복된 닉네임이에요!
      internal static let duplicated = L10n.tr("Localizable", "NickName.error.duplicated")
      /// 특수문자, 띄어쓰기는 쓸 수 없어요!
      internal static let textformat = L10n.tr("Localizable", "NickName.error.textformat")
    }
    internal enum Textfield {
      /// 영어 8자/한글 6자까지 쓸 수 있어요.
      internal static let placeholder = L10n.tr("Localizable", "NickName.textfield.placeholder")
    }
  }

  internal enum Onboarding {
    internal enum Modal {
      internal enum Cancel {
        internal enum Button {
          /// 아니요
          internal static let no = L10n.tr("Localizable", "Onboarding.Modal.Cancel.Button.no")
          /// 네
          internal static let yes = L10n.tr("Localizable", "Onboarding.Modal.Cancel.Button.yes")
        }
        internal enum Message {
          /// 정보를 입력하지 않으면
          internal static let _1 = L10n.tr("Localizable", "Onboarding.Modal.Cancel.Message.1")
          /// 둘러보기만 가능해요! 그만할까요?
          internal static let _2 = L10n.tr("Localizable", "Onboarding.Modal.Cancel.Message.2")
        }
      }
    }
  }

  internal enum OnboardingCompletion {
    /// 이제 러너비에서 함께 달려볼까요?
    internal static let subTitle = L10n.tr("Localizable", "OnboardingCompletion.subTitle")
    /// 나를 충분히 소개했어요. 달릴 준비 완료!
    internal static let title = L10n.tr("Localizable", "OnboardingCompletion.title")
    internal enum Button {
      /// Start!
      internal static let start = L10n.tr("Localizable", "OnboardingCompletion.Button.start")
    }
  }

  internal enum PhotoCertification {
    /// 해당 정보는 러너님이 직장인임을 확인하는 용도로만
    internal static let subTitle1 = L10n.tr("Localizable", "PhotoCertification.subTitle1")
    /// 사용되며, 인증 후 안전하게 폐기됩니다.
    internal static let subTitle2 = L10n.tr("Localizable", "PhotoCertification.subTitle2")
    /// 사진(ex. 사원증, 명함)으로
    internal static let title1 = L10n.tr("Localizable", "PhotoCertification.title1")
    /// 직업을 인증해주세요!
    internal static let title2 = L10n.tr("Localizable", "PhotoCertification.title2")
    internal enum Button {
      internal enum Certificate {
        /// 인증하기
        internal static let title = L10n.tr("Localizable", "PhotoCertification.Button.Certificate.title")
      }
    }
    internal enum ImageRule {
      /// 👉
      internal static let emoji = L10n.tr("Localizable", "PhotoCertification.ImageRule.emoji")
      /// 정보를 식별할 수 있어야 해요
      internal static let no2 = L10n.tr("Localizable", "PhotoCertification.ImageRule.no2")
      /// 개인정보 보호를 위해 다른 정보는 가려주세요
      internal static let no3 = L10n.tr("Localizable", "PhotoCertification.ImageRule.no3")
      internal enum No1 {
        /// 직장명, 직무/직위
        internal static let highlighted = L10n.tr("Localizable", "PhotoCertification.ImageRule.no1.highlighted")
        /// 는 꼭 드러나야 해요!
        internal static let normal = L10n.tr("Localizable", "PhotoCertification.ImageRule.no1.normal")
      }
    }
    internal enum Modal {
      /// 인증 확인까지 최대 6시간 정도가
      internal static let title1 = L10n.tr("Localizable", "PhotoCertification.Modal.title1")
      /// 소요될 수 있어요!
      internal static let title2 = L10n.tr("Localizable", "PhotoCertification.Modal.title2")
      internal enum Button {
        /// 촬영하기
        internal static let _1 = L10n.tr("Localizable", "PhotoCertification.Modal.Button.1")
        /// 앨범에서 선택하기
        internal static let _2 = L10n.tr("Localizable", "PhotoCertification.Modal.Button.2")
      }
    }
    internal enum NavBar {
      /// TITLE
      internal static let title = L10n.tr("Localizable", "PhotoCertification.NavBar.title")
    }
  }

  internal enum PolicyDetail {
    internal enum NavBar {
      /// 제목
      internal static let title = L10n.tr("Localizable", "PolicyDetail.NavBar.title")
    }
  }

  internal enum PolicyTerm {
    /// 먼저 이용약관을 읽고
    internal static let title1 = L10n.tr("Localizable", "PolicyTerm.title1")
    /// 동의해주세요!
    internal static let title2 = L10n.tr("Localizable", "PolicyTerm.title2")
    internal enum Agree {
      internal enum All {
        /// 모든 약관을 읽었으며, 이에 동의해요
        internal static let title = L10n.tr("Localizable", "PolicyTerm.Agree.All.title")
      }
      internal enum Location {
        /// [필수] 위치기반 서비스 이용약관 동의
        internal static let title = L10n.tr("Localizable", "PolicyTerm.Agree.Location.title")
      }
      internal enum Privacy {
        /// [필수] 개인정보 수집/이용 동의
        internal static let title = L10n.tr("Localizable", "PolicyTerm.Agree.Privacy.title")
      }
      internal enum Service {
        /// [필수] 서비스 이용약관 동의
        internal static let title = L10n.tr("Localizable", "PolicyTerm.Agree.Service.title")
      }
    }
    internal enum Button {
      internal enum Next {
        /// 다음
        internal static let title = L10n.tr("Localizable", "PolicyTerm.Button.Next.title")
      }
    }
  }

  internal enum Post {
    internal enum Date {
      /// 일시
      internal static let title = L10n.tr("Localizable", "Post.Date.Title")
    }
    internal enum Place {
      /// 모임 장소
      internal static let title = L10n.tr("Localizable", "Post.Place.Title")
      internal enum Guide {
        /// *정확한 위치는 참여 러너에게만 보여요!
        internal static let readable = L10n.tr("Localizable", "Post.Place.Guide.Readable")
      }
    }
    internal enum Time {
      /// 소요 시간
      internal static let title = L10n.tr("Localizable", "Post.Time.Title")
    }
    internal enum Title {
      /// ex) A 직군 모여라, 묵언 러닝 하실 분, 마라톤 완주!
      internal static let placeHolder = L10n.tr("Localizable", "Post.Title.PlaceHolder")
      /// 제목
      internal static let title = L10n.tr("Localizable", "Post.Title.Title")
    }
    internal enum WorkTime {
      /// 퇴근 후
      internal static let afterWork = L10n.tr("Localizable", "Post.WorkTime.AfterWork")
      /// 출근 전
      internal static let beforeWork = L10n.tr("Localizable", "Post.WorkTime.BeforeWork")
      /// 휴일
      internal static let dayOff = L10n.tr("Localizable", "Post.WorkTime.DayOff")
    }
  }

  internal enum SelectGender {
    /// 성별을 선택해주세요.
    internal static let title = L10n.tr("Localizable", "SelectGender.title")
    internal enum Button {
      internal enum Next {
        /// 다음
        internal static let title = L10n.tr("Localizable", "SelectGender.Button.Next.title")
      }
    }
    internal enum NavBar {
      /// TITLE
      internal static let title = L10n.tr("Localizable", "SelectGender.NavBar.title")
    }
  }

  internal enum SelectJobGroup {
    /// 추후 마이페이지에서 수정할 수 있어요!
    internal static let subTitle = L10n.tr("Localizable", "SelectJobGroup.subTitle")
    /// 어떤 직군에서
    internal static let title1 = L10n.tr("Localizable", "SelectJobGroup.title1")
    /// 활동하시나요?
    internal static let title2 = L10n.tr("Localizable", "SelectJobGroup.title2")
    internal enum Button {
      internal enum Next {
        /// 다음
        internal static let title = L10n.tr("Localizable", "SelectJobGroup.Button.Next.title")
      }
    }
    internal enum NavBar {
      /// TITLE
      internal static let title = L10n.tr("Localizable", "SelectJobGroup.NavBar.title")
    }
  }

  internal enum WaitCertification {
    /// 제출이 완료되었습니다. 확인 후 알려드릴게요!
    internal static let title1 = L10n.tr("Localizable", "WaitCertification.title1")
    internal enum Button {
      /// 메인 화면으로
      internal static let toMain = L10n.tr("Localizable", "WaitCertification.Button.toMain")
    }
    internal enum SubTitle1 {
      /// 소요 시간은 
      internal static let _1 = L10n.tr("Localizable", "WaitCertification.subTitle1.1")
      /// 최대 6시간
      internal static let _2 = L10n.tr("Localizable", "WaitCertification.subTitle1.2")
      ///  정도이며, 완료 시 알림을 보내드립니다. 그 전까지는 둘러보기만 가능해요
      internal static let _3 = L10n.tr("Localizable", "WaitCertification.subTitle1.3")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
