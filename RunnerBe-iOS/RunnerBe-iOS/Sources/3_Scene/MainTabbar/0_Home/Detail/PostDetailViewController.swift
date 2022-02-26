//
//  PostDetailViewController.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/25.
//

import RxCocoa
import RxGesture
import RxSwift
import SnapKit
import Then
import UIKit

class PostDetailViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialLayout()

        viewModelInput()
        viewModelOutput()
    }

    init(viewModel: PostDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var viewModel: PostDetailViewModel

    private func viewModelInput() {
        navBar.leftBtnItem.rx.tap
            .bind(to: viewModel.inputs.backward)
            .disposed(by: disposeBags)

        navBar.rightBtnItem.rx.tap
            .bind(to: viewModel.inputs.report)
            .disposed(by: disposeBags)
    }

    private func viewModelOutput() {
        viewModel.outputs.detailData
            .subscribe(onNext: { [weak self] data in
                self?.titleView.setup(title: data.running.title, tag: data.running.badge)
                self?.infoView.setup(
                    place: data.running.placeInfo,
                    date: data.running.date,
                    time: data.running.time,
                    numLimit: data.running.numParticipant,
                    gender: data.running.gender,
                    age: data.running.age
                )
                self?.textView.text = data.running.contents
                self?.detailMapView.setup(
                    lat: data.running.lat,
                    long: data.running.long,
                    range: data.running.range
                )

                let userInfoViews = data.participants.reduce(into: [UIView]()) {
                    let view = UserInfoView()
                    view.setup(userInfo: $1)
                    $0.append(view)
                }

                self?.participantView.arrangedSubviews.forEach { $0.removeFromSuperview() }
                self?.participantView.addArrangedSubviews(userInfoViews)
            })
            .disposed(by: disposeBags)
    }

    private var detailMapView = DetailMapView()
    private var titleView = DetailTitleView()
    private var hDivider1 = UIView().then { view in
        view.backgroundColor = .darkG55
    }

    private var infoView = DetailInfoView()
    private var hDivider2 = UIView().then { view in
        view.backgroundColor = .darkG55
    }

    private var textView = UITextView().then { view in
        view.font = .iosBody15R
        view.textColor = .darkG25
        view.text = "TEST\nTEST\nTEST\nTEST\nTEST\nTEST\nTEST\nTEST"
        view.isScrollEnabled = false
        view.backgroundColor = .clear
    }

    private var hDivider3 = UIView().then { view in
        view.backgroundColor = .darkG55
    }

    private lazy var vStackView = UIStackView.make(
        with: [
            titleView,
            hDivider1,
            infoView,
            hDivider2,
            textView,
            hDivider3,
        ],
        axis: .vertical,
        alignment: .fill,
        distribution: .equalSpacing,
        spacing: 15
    )

    private var participantHeader = UserInfoHeader()

    private var participantView = UIStackView.make(
        with: [UserInfoView(), UserInfoView(), UserInfoView(), UserInfoView(), UserInfoView(), UserInfoView()],
        axis: .vertical,
        alignment: .fill,
        distribution: .equalSpacing,
        spacing: 0
    )

    private var scrollView = UIScrollView().then { view in
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceVertical = false
    }

    private var navBar = RunnerbeNavBar().then { navBar in
        navBar.titleLabel.text = "TITLE"
        navBar.titleLabel.font = .iosBody17Sb
        navBar.titleLabel.textColor = .darkG35
        navBar.leftBtnItem.setImage(Asset.arrowLeft.uiImage.withTintColor(.darkG3), for: .normal)
        navBar.rightBtnItem.setImage(Asset.report.uiImage.withTintColor(.darkG3), for: .normal)
        navBar.rightSecondBtnItem.isHidden = true
    }
}

// MARK: - Layout

extension PostDetailViewController {
    private func setupViews() {
        gradientBackground()

        view.addSubviews([
            navBar,
            scrollView,
        ])

        scrollView.addSubviews([
            detailMapView,
            vStackView,
            participantHeader,
            participantView,
        ])
    }

    private func initialLayout() {
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide
                .snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        detailMapView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(160)
        }

        vStackView.snp.makeConstraints { make in
            make.top.equalTo(detailMapView.snp.bottom).offset(24)
            make.leading.equalTo(scrollView.snp.leading).offset(16)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-16)
        }

        hDivider1.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            make.height.equalTo(1)
        }
        hDivider2.snp.makeConstraints { make in
            make.leading.equalTo(vStackView.snp.leading)
            make.trailing.equalTo(vStackView.snp.trailing)
            make.height.equalTo(1)
        }

        hDivider3.snp.makeConstraints { make in
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(10)
        }

        participantHeader.snp.makeConstraints { make in
            make.top.equalTo(vStackView.snp.bottom).offset(20)
            make.leading.equalTo(vStackView.snp.leading)
        }

        participantView.snp.makeConstraints { make in
            make.top.equalTo(participantHeader.snp.bottom).offset(4)
            make.leading.equalTo(vStackView.snp.leading)
            make.trailing.equalTo(vStackView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }

    private func gradientBackground() {
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.colors = [
            UIColor.bgBottom.cgColor,
            UIColor.bgTop.cgColor,
        ]
        backgroundGradientLayer.frame = view.bounds
        view.layer.addSublayer(backgroundGradientLayer)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
