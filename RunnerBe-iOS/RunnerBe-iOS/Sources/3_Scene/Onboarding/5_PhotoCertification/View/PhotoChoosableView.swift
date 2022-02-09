//
//  PhotoChoosableView.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/08.
//

import RxCocoa
import RxGesture
import RxSwift
import Then
import UIKit

class PhotoChoosableView: UIView {
    var image: UIImage? {
        didSet {
            if let newImage = image {
                mainImageView.image = newImage
                deleteIcon.isHidden = false
                uploadIcon.isHidden = true
            } else {
                mainImageView.image = nil
                deleteIcon.isHidden = true
                uploadIcon.isHidden = false
            }
            mainImageView.setNeedsDisplay()
        }
    }

    var deleteIconTapped: Observable<Void> {
        deleteIcon.rx.tapGesture()
            .when(.recognized)
            .map { _ in }
    }

    init() {
        super.init(frame: .zero)
        setupViews()
        initialLayout()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var mainImageView = UIImageView().then { view in
        view.contentMode = .scaleAspectFit
    }

    private var deleteIcon = UIImageView().then { view in
        view.image = Asset.x.uiImage
        view.tintColor = .darkG25
        view.isHidden = true
    }

    private var uploadIcon = UIImageView().then { view in
        view.image = Asset.upload.uiImage
        view.isHidden = false
        view.backgroundColor = .clear
    }
}

// MARK: - Layout

extension PhotoChoosableView {
    private func setupViews() {
        addSubviews([
            mainImageView,
            deleteIcon,
            uploadIcon,
        ])
    }

    private func initialLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }

        deleteIcon.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.top.equalTo(self.snp.top).offset(8)
            make.width.equalTo(36)
            make.height.equalTo(36)
        }

        uploadIcon.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }
    }
}
