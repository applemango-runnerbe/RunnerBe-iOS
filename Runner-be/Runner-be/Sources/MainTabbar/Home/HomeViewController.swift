//
//  HomeViewController.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/05.
//

import RxCocoa
import RxDataSources
import RxGesture
import RxSwift
import SnapKit
import Then
import Toast_Swift
import UIKit

import MapKit

class HomeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialLayout()

        viewModelInput()
        viewModelOutput()
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var viewModel: HomeViewModel

    private func viewModelInput() {
        bindBottomSheetGesture()
    }

    private func viewModelOutput() {}

    private func bindBottomSheetGesture() {
        bottomSheet.rx.panGesture()
            .when(.changed)
            .asTranslation()
            .subscribe(onNext: { [unowned self] translation, _ in

                let maxHeight = view.frame.height - navBar.frame.height
                let offset = bottomSheetPanGestureOffsetH - translation.y
                bottomSheetHeight.constant = max(
                    Constants.BottomSheet.heightMin,
                    min(
                        maxHeight,
                        bottomSheetHeight.constant + offset
                    )
                )
                bottomSheetPanGestureOffsetH = translation.y

                if bottomSheetHeight.constant > maxHeight - Constants.BottomSheet.cornerRadius {
                    bottomSheet.layer.cornerRadius = maxHeight - bottomSheetHeight.constant
                } else {
                    bottomSheet.layer.cornerRadius = Constants.BottomSheet.cornerRadius
                }
            })
            .disposed(by: disposeBag)

        bottomSheet.rx.panGesture()
            .when(.ended)
            .asTranslation()
            .subscribe(onNext: { [unowned self] _, _ in

                let maxHeight = view.frame.height - navBar.frame.height
                let currentHeight = bottomSheet.frame.height

                let targetHeight: CGFloat
                if currentHeight > Constants.BottomSheet.heightMiddle {
                    if currentHeight - Constants.BottomSheet.heightMiddle > maxHeight - currentHeight {
                        targetHeight = maxHeight
                    } else {
                        targetHeight = Constants.BottomSheet.heightMiddle
                    }
                } else {
                    if currentHeight - Constants.BottomSheet.heightMin > Constants.BottomSheet.heightMiddle - currentHeight {
                        targetHeight = Constants.BottomSheet.heightMiddle
                    } else {
                        targetHeight = Constants.BottomSheet.heightMin
                    }
                }
                bottomSheetHeight.constant = targetHeight

                if bottomSheetHeight.constant > maxHeight - Constants.BottomSheet.cornerRadius {
                    bottomSheet.layer.cornerRadius = maxHeight - bottomSheetHeight.constant
                } else {
                    bottomSheet.layer.cornerRadius = Constants.BottomSheet.cornerRadius
                }

                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
                    self.view.layoutIfNeeded()
                }

                bottomSheetPanGestureOffsetH = 0
            })
            .disposed(by: disposeBag)
    }

    enum Constants {
        enum NavigationBar {
            static let backgroundColor: UIColor = .darkG7
        }

        enum BottomSheet {
            static let backgrouncColor: UIColor = .darkG7
            static let cornerRadius: CGFloat = 12
            static let heightMiddle: CGFloat = 294
            static let heightMin: CGFloat = 65

            enum GreyHandle {
                static let top: CGFloat = 16
                static let width: CGFloat = 37
                static let height: CGFloat = 3
                static let color: UIColor = .darkG6
            }

            enum Title {
                static let leading: CGFloat = 16
                static let top: CGFloat = 24
                static let color: UIColor = .darkG25
                static let font: UIFont = .iosTitle19R
                static let text: String = L10n.Home.BottomSheet.title
            }

            enum SelectionLabel {
                static let onStyle = BadgeLabel.Style(
                    font: .iosBody13B,
                    backgroundColor: .primarydark,
                    textColor: .black,
                    borderWidth: 0,
                    borderColor: .primarydarker,
                    cornerRadiusRatio: 1,
                    useCornerRadiusAsFactor: true,
                    padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
                )

                static let offStyle = BadgeLabel.Style(
                    font: .iosBody13R,
                    backgroundColor: .clear,
                    textColor: .darkG3,
                    borderWidth: 1,
                    borderColor: .darkG3,
                    cornerRadiusRatio: 1,
                    useCornerRadiusAsFactor: true,
                    padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
                )
            }
        }
    }

    private var navBar = RunnerbeNavBar().then { navBar in
        navBar.titleLabel.font = .aggroLight
        navBar.titleLabel.text = L10n.Home.PostList.NavBar.title
        navBar.titleLabel.textColor = .primarydark
        navBar.rightBtnItem.setImage(Asset.search.uiImage, for: .normal)
        navBar.rightSecondBtnItem.isHidden = true
        navBar.rightBtnItem.isHidden = true
        navBar.titleSpacing = 8
        navBar.backgroundColor = Constants.NavigationBar.backgroundColor
    }

    private var mapView = MKMapView()

    private var bottomSheet = UIView().then { view in
        view.backgroundColor = Constants.BottomSheet.backgrouncColor
        view.layer.cornerRadius = Constants.BottomSheet.cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
    }

    private lazy var bottomSheetHeight = bottomSheet.heightAnchor.constraint(equalToConstant: Constants.BottomSheet.heightMiddle)
    var bottomSheetPanGestureOffsetH: CGFloat = 0

    private var greyHandle = UIView().then { view in
        view.backgroundColor = Constants.BottomSheet.GreyHandle.color
    }

    private var sheetTitle = UILabel().then { label in
        label.textColor = Constants.BottomSheet.Title.color
        label.text = Constants.BottomSheet.Title.text
        label.font = Constants.BottomSheet.Title.font
    }
}

// MARK: - Layout

extension HomeViewController {
    private func setupViews() {
        view.addSubviews([
            navBar,
            mapView,
            bottomSheet,
        ])

        bottomSheet.addSubviews([
            greyHandle,
            sheetTitle,
        ])
    }

    private func initialLayout() {
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }

        mapView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }

        bottomSheet.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        bottomSheetHeight.isActive = true

        greyHandle.snp.makeConstraints { make in
            make.top.equalTo(bottomSheet.snp.top).offset(Constants.BottomSheet.GreyHandle.top)
            make.centerX.equalTo(bottomSheet.snp.centerX)
            make.height.equalTo(Constants.BottomSheet.GreyHandle.height)
            make.width.equalTo(Constants.BottomSheet.GreyHandle.width)
        }

        sheetTitle.snp.makeConstraints { make in
            make.top.equalTo(bottomSheet.snp.top).offset(Constants.BottomSheet.Title.top)
            make.leading.equalTo(bottomSheet.snp.leading).offset(Constants.BottomSheet.Title.leading)
        }
    }
}
