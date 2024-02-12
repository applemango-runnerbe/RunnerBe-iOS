//
//  RegisterRunningPaceViewController.swift
//  Runner-be
//
//  Created by 이유리 on 2/12/24.
//

import RxCocoa
import RxGesture
import RxSwift
import SnapKit
import Then
import UIKit

final class RegisterRunningPaceViewController: BaseViewController {
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialLayout()

        viewModelInput()
        viewModelOutput()
    }

    init(viewModel: RegisterRunningPaceViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: ViewModel Binding

    private var viewModel: RegisterRunningPaceViewModel

    private func viewModelInput() {
        navBar.rightBtnItem.rx.tap
            .bind(to: viewModel.inputs.close)
            .disposed(by: disposeBag)
    }

    private func viewModelOutput() {}

    // MARK: Private

    private var navBar = RunnerbeNavBar().then { navBar in
        navBar.titleLabel.text = "페이스 등록"
        navBar.leftBtnItem.isHidden = true
        navBar.rightBtnItem.setImage(Asset.x.uiImage.withTintColor(.darkG3), for: .normal)
        navBar.rightSecondBtnItem.isHidden = true
    }

    private var titleLabel = UILabel().then { label in
        var font = UIFont.aggroLight.withSize(26)
        label.font = font
        label.setTextWithLineHeight(text: L10n.RunningPace.Register.title, with: 42)
        label.textColor = .primary
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
    }

    private var subTitleLabel = UILabel().then { label in
        label.font = .pretendardRegular14
        label.setTextWithLineHeight(text: L10n.RunningPace.Register.subtitle, with: 22)
        label.textColor = .darkG25
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
    }

    private var beginnerView = RegisterRunningPaceView().then { view in
        view.titleLabel.text = L10n.RunningPace.Beginner.title
        view.subTitleLabel.text = L10n.RunningPace.Beginner.description
    }

    private var averageView = RegisterRunningPaceView().then { view in
        view.titleLabel.text = L10n.RunningPace.Average.title
        view.subTitleLabel.text = L10n.RunningPace.Average.description
    }

    private var highView = RegisterRunningPaceView().then { view in
        view.titleLabel.text = L10n.RunningPace.High.title
        view.subTitleLabel.text = L10n.RunningPace.High.description
    }

    private var masterView = RegisterRunningPaceView().then { view in
        view.titleLabel.text = L10n.RunningPace.Master.title
        view.subTitleLabel.text = L10n.RunningPace.Master.description
    }

    private lazy var stackView = UIStackView.make(with: [
        beginnerView,
        averageView,
        highView,
        masterView,
    ], axis: .vertical, spacing: 12)

    private var completeButton = UIButton().then { button in
        button.setTitle("등록하기", for: .normal)
        button.setTitleColor(UIColor.darkG4, for: .disabled)
        button.setBackgroundColor(UIColor.darkG5, for: .disabled)

        button.titleLabel?.font = .iosBody15B
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.isEnabled = false
    }
}

// MARK: - Layout

extension RegisterRunningPaceViewController {
    private func setupViews() {
        setBackgroundColor()

        view.addSubviews([
            navBar,
            titleLabel,
            subTitleLabel,
            stackView,
            completeButton,
        ])
    }

    private func initialLayout() {
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(26)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-104)
        }

        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel.snp.leading)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        completeButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-21)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            make.height.equalTo(48)
        }
    }
}
