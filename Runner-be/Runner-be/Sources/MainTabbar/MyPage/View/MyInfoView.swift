//
//  MyInfoView.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/27.
//

import SnapKit
import Then
import UIKit

final class MyInfoView: UIView {
    init() {
        super.init(frame: .zero)
        setupViews()
        initialLayout()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var backgroundView = UIView().then { view in
        view.backgroundColor = .black
    }

    var registerPaceView = MyPageProfileLabel(iconPosition: .right).then { view in
        view.icon.image = Asset.plusDarkG4.uiImage
        view.label.text = "👟 페이스 등록"
    }

    var paceView = RunningPaceView()

    private var vDivider = UIImageView().then { view in
        view.image = Asset.vDivider.uiImage
        view.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(30)
        }
    }

    var levelView = MyPageProfileLabel(iconPosition: .left).then { view in
        view.icon.image = Asset.smile.uiImage
        view.label.text = "초보 출석"
    }

    var editPaceLabel = UILabel().then { view in
        view.text = "페이스 수정하기"
        view.font = .pretendardRegular12
        view.textColor = .darkG25
        view.isHidden = true
    }
}

extension MyInfoView {
    func setupViews() {
        addSubviews([
            backgroundView,
            editPaceLabel,
        ])

        backgroundView.addSubviews([
            registerPaceView,
            vDivider,
            levelView,
            paceView,
        ])
    }

    func initialLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }

        vDivider.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        registerPaceView.snp.makeConstraints { make in
            make.trailing.equalTo(vDivider.snp.leading).offset(-24)
            make.centerY.equalToSuperview()
        }

        paceView.snp.makeConstraints { make in
            make.trailing.equalTo(vDivider.snp.leading).offset(-24)
            make.centerY.equalToSuperview()
        }

        levelView.snp.makeConstraints { make in
            make.leading.equalTo(vDivider.snp.trailing).offset(24)
            make.centerY.equalToSuperview()
        }

        editPaceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(backgroundView.snp.trailing)
            make.top.equalTo(backgroundView.snp.bottom).offset(8)
            make.bottom.equalToSuperview()
        }
    }

    func configure(userConfig: UserConfig) {
        levelView.label.text = userConfig.diligence

        switch userConfig.diligence {
        case "성실 출석":
            levelView.icon.image = Asset.smile.uiImage
        case "노력 출석":
            levelView.icon.image = Asset.icEffortRunner.uiImage
        case "불량 출석":
            levelView.icon.image = Asset.icBadRunner.uiImage
        case "초보 출석":
            levelView.icon.image = Asset.icBasicRunner.uiImage
        default:
            break
        }

        guard userConfig.pace != nil else {
            registerPaceView.isHidden = false
            paceView.isHidden = true
            return
        }

        registerPaceView.isHidden = true
        paceView.isHidden = false
        editPaceLabel.isHidden = false

        switch userConfig.pace {
        case "beginner":
            paceView.icon.image = .runningPaceBeginner
            paceView.label.text = L10n.RunningPace.Beginner.title
        case "average":
            paceView.icon.image = .runningPaceAverage
            paceView.label.text = L10n.RunningPace.Average.title
        case "high":
            paceView.icon.image = .runningPaceHigh
            paceView.label.text = L10n.RunningPace.High.title
        case "master":
            paceView.icon.image = .runningPaceMaster
            paceView.label.text = L10n.RunningPace.Master.title
        default:
            break
        }
    }
}
