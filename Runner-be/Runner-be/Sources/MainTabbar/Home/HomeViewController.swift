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

        showClosedPostView.rx.tapGesture(configuration: nil)
            .map { _ in }
            .bind(to: viewModel.inputs.tapShowClosedPost)
            .disposed(by: disposeBag)

        postCollectionView.rx.itemSelected
            .map { $0.item }
            .bind(to: viewModel.inputs.tapPost)
            .disposed(by: disposeBag)
    }

    private func viewModelOutput() {
        postCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        typealias PostSectionDataSource = RxCollectionViewSectionedAnimatedDataSource<BasicPostSection>

        let dataSource = PostSectionDataSource { [weak self] _, collectionView, indexPath, item in
            guard let self = self,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicPostCell.id, for: indexPath) as? BasicPostCell
            else { return UICollectionViewCell() }

            self.viewModel.outputs.bookMarked
                .filter { $0.idx == indexPath.row }
                .map { $0.marked }
                .subscribe(onNext: { [weak cell] marked in
                    cell?.postInfoView.bookMarkIcon.isSelected = marked
                })
                .disposed(by: cell.disposeBag)

            cell.postInfoView.bookMarkIcon.rx.tap
                .map { indexPath.row }
                .subscribe(onNext: { [weak self] idx in
                    self?.viewModel.inputs.tapPostBookMark.onNext(idx)
                })
                .disposed(by: cell.disposeBag)

            cell.configure(with: item)
            return cell
        }

        viewModel.outputs.posts
            .map {
                $0.reduce(into: [PostCellConfig]()) {
                    $0.append(PostCellConfig(from: $1))
                }
            }
            .map { [BasicPostSection(items: $0)] }
            .bind(to: postCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        viewModel.outputs.showClosedPost
            .subscribe(onNext: { [weak self] show in
                self?.showClosedPost(show)
            })
            .disposed(by: disposeBag)
    }

    private func bindBottomSheetGesture() {
        bottomSheet.rx.panGesture()
            .when(.changed)
            .filter { [unowned self] gesture in
                let location = gesture.location(in: self.bottomSheet)
                return isBottomSheetPanGestureEnable(with: location)
            }
            .asTranslation()
            .subscribe(onNext: { [unowned self] translation, _ in
                self.onPanGesture(translation: translation)
            })
            .disposed(by: disposeBag)

        bottomSheet.rx.panGesture()
            .when(.ended)
            .asTranslation()
            .subscribe(onNext: { [unowned self] _, _ in
                onPanGestureEnded()
            })
            .disposed(by: disposeBag)
    }

    private func showClosedPost(_ show: Bool) {
        if show {
            showClosedPostView.label.font = Constants.BottomSheet.SelectionLabel.HighLighted.font
            showClosedPostView.label.textColor = Constants.BottomSheet.SelectionLabel.HighLighted.textColor
            showClosedPostView.backgroundColor = Constants.BottomSheet.SelectionLabel.HighLighted.backgroundColor
            showClosedPostView.layer.borderWidth = Constants.BottomSheet.SelectionLabel.HighLighted.borderWidth
            showClosedPostView.layer.borderColor = Constants.BottomSheet.SelectionLabel.HighLighted.borderColor
        } else {
            showClosedPostView.label.font = Constants.BottomSheet.SelectionLabel.Normal.font
            showClosedPostView.label.textColor = Constants.BottomSheet.SelectionLabel.Normal.textColor
            showClosedPostView.backgroundColor = Constants.BottomSheet.SelectionLabel.Normal.backgroundColor
            showClosedPostView.layer.borderWidth = Constants.BottomSheet.SelectionLabel.Normal.borderWidth
            showClosedPostView.layer.borderColor = Constants.BottomSheet.SelectionLabel.Normal.borderColor
        }
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
                static let height: CGFloat = 29
                static let color: UIColor = .darkG25
                static let font: UIFont = .iosTitle21Sb
                static let text: String = L10n.Home.BottomSheet.title
            }

            enum SelectionLabel {
                static let iconSize: CGSize = .init(width: 16, height: 16)
                static let height: CGFloat = 27
                static let cornerRadius: CGFloat = height / 2.0
                static let padding: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 6)

                enum HighLighted {
                    static let font: UIFont = .iosBody13B
                    static let backgroundColor: UIColor = .primarydark
                    static let textColor: UIColor = .darkBlack
                    static let borderWidth: CGFloat = 0
                    static let borderColor: CGColor = UIColor.primarydark.cgColor
                    static let icon: UIImage = Asset.chevronDown.uiImage.withTintColor(.darkBlack)
                }

                enum Normal {
                    static let font: UIFont = .iosBody13R
                    static let backgroundColor: UIColor = .clear
                    static let textColor: UIColor = .darkG3
                    static let borderWidth: CGFloat = 1
                    static let borderColor: CGColor = UIColor.darkG3.cgColor
                    static let icon: UIImage = Asset.chevronDown.uiImage.withTintColor(.darkG3)
                }

                enum RunningTag {
                    static let leading: CGFloat = 16
                    static let top: CGFloat = Title.top + Title.height + 23
                }

                enum OrderTag {
                    static let leading: CGFloat = 12
                }

                enum ShowClosedPost {
                    static let leading: CGFloat = 12
                    static let padding: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
                }
            }

            enum PostList {
                static let top: CGFloat = Title.top + Title.height + 70
                static let minimumLineSpacing: CGFloat = 12
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

    private var mapView = RunnerBeMapView()

    private var bottomSheet = UIView().then { view in
        view.backgroundColor = Constants.BottomSheet.backgrouncColor
        view.layer.cornerRadius = Constants.BottomSheet.cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
    }

    // view.bottom 과 bottomSheet.top 이므로 constant를 음수로 설정해야 함
    private lazy var bottomSheetHeight = bottomSheet.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -Constants.BottomSheet.heightMiddle)
    var bottomSheetPanGestureOffsetH: CGFloat = 0

    private var greyHandle = UIView().then { view in
        view.backgroundColor = Constants.BottomSheet.GreyHandle.color
    }

    private var sheetTitle = UILabel().then { label in
        label.textColor = Constants.BottomSheet.Title.color
        label.text = Constants.BottomSheet.Title.text
        label.font = Constants.BottomSheet.Title.font
    }

    private var runningTagView = SelectionLabel().then { view in

        view.padding = Constants.BottomSheet.SelectionLabel.padding
        view.iconSize = Constants.BottomSheet.SelectionLabel.iconSize
        view.layer.cornerRadius = Constants.BottomSheet.SelectionLabel.cornerRadius

        view.label.font = Constants.BottomSheet.SelectionLabel.HighLighted.font
        view.label.textColor = Constants.BottomSheet.SelectionLabel.HighLighted.textColor
        view.backgroundColor = Constants.BottomSheet.SelectionLabel.HighLighted.backgroundColor
        view.layer.borderWidth = Constants.BottomSheet.SelectionLabel.HighLighted.borderWidth
        view.layer.borderColor = Constants.BottomSheet.SelectionLabel.HighLighted.borderColor
        view.icon.image = Constants.BottomSheet.SelectionLabel.HighLighted.icon

        view.label.text = "출근 전"
    }

    private var orderTagView = SelectionLabel().then { view in

        view.padding = Constants.BottomSheet.SelectionLabel.padding
        view.iconSize = Constants.BottomSheet.SelectionLabel.iconSize
        view.layer.cornerRadius = Constants.BottomSheet.SelectionLabel.cornerRadius

        view.label.font = Constants.BottomSheet.SelectionLabel.Normal.font
        view.label.textColor = Constants.BottomSheet.SelectionLabel.Normal.textColor
        view.backgroundColor = Constants.BottomSheet.SelectionLabel.Normal.backgroundColor
        view.layer.borderWidth = Constants.BottomSheet.SelectionLabel.Normal.borderWidth
        view.layer.borderColor = Constants.BottomSheet.SelectionLabel.Normal.borderColor
        view.icon.image = Constants.BottomSheet.SelectionLabel.Normal.icon

        view.label.text = "찜 많은 순"
    }

    private var showClosedPostView = SelectionLabel().then { view in

        view.padding = Constants.BottomSheet.SelectionLabel.ShowClosedPost.padding
        view.layer.cornerRadius = Constants.BottomSheet.SelectionLabel.cornerRadius

        view.label.font = Constants.BottomSheet.SelectionLabel.Normal.font
        view.label.textColor = Constants.BottomSheet.SelectionLabel.Normal.textColor
        view.backgroundColor = Constants.BottomSheet.SelectionLabel.Normal.backgroundColor
        view.layer.borderWidth = Constants.BottomSheet.SelectionLabel.Normal.borderWidth
        view.layer.borderColor = Constants.BottomSheet.SelectionLabel.Normal.borderColor

        view.label.text = "마감 포함"
    }

    private lazy var postCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.BottomSheet.PostList.minimumLineSpacing
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BasicPostCell.self, forCellWithReuseIdentifier: BasicPostCell.id)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
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
            runningTagView,
            orderTagView,
            showClosedPostView,
            postCollectionView,
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
            make.height.equalTo(UIScreen.main.bounds.height - AppContext.shared.safeAreaInsets.bottom - AppContext.shared.safeAreaInsets.top - AppContext.shared.tabHeight)
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
            make.height.equalTo(Constants.BottomSheet.Title.height)
        }

        runningTagView.snp.makeConstraints { make in
            make.top.equalTo(bottomSheet.snp.top).offset(Constants.BottomSheet.SelectionLabel.RunningTag.top)
            make.leading.equalTo(bottomSheet.snp.leading).offset(Constants.BottomSheet.SelectionLabel.RunningTag.leading)
            make.height.equalTo(Constants.BottomSheet.SelectionLabel.height)
        }

        orderTagView.snp.makeConstraints { make in
            make.top.equalTo(runningTagView.snp.top)
            make.leading.equalTo(runningTagView.snp.trailing).offset(Constants.BottomSheet.SelectionLabel.OrderTag.leading)
            make.height.equalTo(Constants.BottomSheet.SelectionLabel.height)
        }

        showClosedPostView.snp.makeConstraints { make in
            make.top.equalTo(runningTagView.snp.top)
            make.leading.equalTo(orderTagView.snp.trailing).offset(Constants.BottomSheet.SelectionLabel.ShowClosedPost.leading)
            make.height.equalTo(Constants.BottomSheet.SelectionLabel.height)
        }

        postCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bottomSheet.snp.top).offset(Constants.BottomSheet.PostList.top)
            make.leading.equalTo(bottomSheet.snp.leading)
            make.trailing.equalTo(bottomSheet.snp.trailing)
            make.bottom.equalTo(bottomSheet.snp.bottom)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return BasicPostCell.size
    }
}

// MARK: - BottomSheet PanGesture

extension HomeViewController {
    enum State {
        enum BottomSheet {
            case open
            case halfOpen
            case closed
        }
    }

    private func isBottomSheetPanGestureEnable(with location: CGPoint) -> Bool {
        let state = bottomSheetState
        if state == .open, postCollectionView.frame.contains(location) {
            return postCollectionView.bounds.origin.y <= 0
        }
        return true
    }

    private func onPanGesture(translation: CGPoint) {
        updateBottomSheetPosition(with: translation)
        updateBottomSheetCornerRadius()
        updatePostCollectionView(with: bottomSheetState)
    }

    private func onPanGestureEnded() {
        let state = bottomSheetState
        let maxHeight = bottomSheetMaxheight

        switch state {
        case .open:
            bottomSheetHeight.constant = -maxHeight
        case .halfOpen:
            bottomSheetHeight.constant = -Constants.BottomSheet.heightMiddle
        case .closed:
            bottomSheetHeight.constant = -Constants.BottomSheet.heightMin
        }

        updateBottomSheetCornerRadius()
        updatePostCollectionView(with: state)

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
        }
        bottomSheetPanGestureOffsetH = 0
    }

    private var bottomSheetState: State.BottomSheet {
        let maxHeight = bottomSheetMaxheight
        let currentHeight = -bottomSheetHeight.constant

        if currentHeight > Constants.BottomSheet.heightMiddle {
            if currentHeight - Constants.BottomSheet.heightMiddle > maxHeight - currentHeight {
                return .open
            } else {
                return .halfOpen
            }
        } else {
            if currentHeight - Constants.BottomSheet.heightMin > Constants.BottomSheet.heightMiddle - currentHeight {
                return .halfOpen
            } else {
                return .closed
            }
        }
    }

    private var bottomSheetMaxheight: CGFloat {
        return view.frame.height - AppContext.shared.safeAreaInsets.top
    }

    private func updateBottomSheetPosition(with translation: CGPoint) {
        let maxHeight = bottomSheetMaxheight
        let offset = bottomSheetPanGestureOffsetH - translation.y

        let bottomSheetHeight = max(
            -Constants.BottomSheet.heightMin,
            min(maxHeight, -bottomSheetHeight.constant + offset)
        )
        bottomSheetPanGestureOffsetH = translation.y

        self.bottomSheetHeight.constant = -bottomSheetHeight
    }

    private func updateBottomSheetCornerRadius() {
        let maxHeight = bottomSheetMaxheight

        if -bottomSheetHeight.constant > maxHeight - Constants.BottomSheet.cornerRadius {
            bottomSheet.layer.cornerRadius = maxHeight - (-bottomSheetHeight.constant)
        } else {
            bottomSheet.layer.cornerRadius = Constants.BottomSheet.cornerRadius
        }
    }

    private func updatePostCollectionView(with state: State.BottomSheet) {
        switch state {
        case .open:
            postCollectionView.isScrollEnabled = true
        case .halfOpen:
            postCollectionView.isScrollEnabled = false
        case .closed:
            postCollectionView.isScrollEnabled = false
        }
    }
}
