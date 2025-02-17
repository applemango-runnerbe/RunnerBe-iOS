//
//  RegisterRunningPaceCancelModalViewController.swift
//  Runner-be
//
//  Created by 이유리 on 4/16/24.
//

import RxCocoa
import RxGesture
import RxSwift
import SnapKit
import Then
import UIKit

final class RegisterRunningPaceCancelModalViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialLayout()

        viewModelInput()
        viewModelOutput()
    }

    init(viewModel: RegisterRunningPaceCancelModalViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var viewModel: RegisterRunningPaceCancelModalViewModel

    private func viewModelInput() {
        sheet.rx.tapGesture(configuration: { _, delegate in
            delegate.simultaneousRecognitionPolicy = .never
        })
        .when(.recognized)
        .subscribe()
        .disposed(by: disposeBag)

        view.rx.tapGesture(configuration: { _, delegate in
            delegate.simultaneousRecognitionPolicy = .never
        })
        .when(.recognized)
        .map { _ in }
        .subscribe(viewModel.inputs.backward)
        .disposed(by: disposeBag)

        buttonOk.rx.tap
            .bind(to: viewModel.inputs.tapOK)
            .disposed(by: disposeBag)

        buttonNo.rx.tap
            .bind(to: viewModel.inputs.backward)
            .disposed(by: disposeBag)
    }

    private func viewModelOutput() {}

    private var sheet = UIView().then { view in
        view.backgroundColor = .darkG5
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
    }

    private var titleLabel = UILabel().then { label in
        label.font = .pretendardRegular16
        label.textColor = .darkG1
        label.text = L10n.RunningPace.Register.Cancel.Modal.title
        label.numberOfLines = 0
        label.textAlignment = .center
    }

    private var hDivider = UIView().then { view in
        view.backgroundColor = .darkG45
    }

    private var buttonOk = UIButton().then { button in
        button.setTitle("예", for: .normal)
        button.setTitleColor(.primary, for: .normal)
        button.setBackgroundColor(.clear, for: .normal)

        button.titleLabel?.font = .pretendardRegular16
    }

    private var vDivider = UIView().then { view in
        view.backgroundColor = .darkG45
    }

    private var buttonNo = UIButton().then { button in
        button.setTitle("아니오", for: .normal)
        button.setTitleColor(.primary, for: .normal)
        button.setBackgroundColor(.clear, for: .normal)

        button.titleLabel?.font = .pretendardRegular16
    }
}

// MARK: - Layout

extension RegisterRunningPaceCancelModalViewController {
    private func setupViews() {
        view.backgroundColor = .bgSheet

        view.addSubviews([
            sheet,
        ])

        sheet.addSubviews([
            titleLabel,
            hDivider,
            buttonOk,
            vDivider,
            buttonNo,
        ])
    }

    private func initialLayout() {
        sheet.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY)
            make.leading.equalTo(52)
            make.trailing.equalTo(-52)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(sheet.snp.top).offset(24)
            make.leading.equalTo(sheet.snp.leading).offset(24)
            make.trailing.equalTo(sheet.snp.trailing).offset(-24)
        }

        hDivider.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
            make.leading.equalTo(sheet.snp.leading)
            make.trailing.equalTo(sheet.snp.trailing)
            make.height.equalTo(1)
        }

        vDivider.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(50)
            make.centerX.equalTo(sheet.snp.centerX)
            make.top.equalTo(hDivider.snp.bottom)
            make.bottom.equalTo(sheet.snp.bottom)
        }

        buttonNo.snp.makeConstraints { make in
            make.top.equalTo(vDivider.snp.top)
            make.leading.equalTo(sheet.snp.leading)
            make.trailing.equalTo(vDivider.snp.leading)
            make.bottom.equalTo(vDivider.snp.bottom)
        }

        buttonOk.snp.makeConstraints { make in
            make.top.equalTo(vDivider.snp.top)
            make.leading.equalTo(vDivider.snp.trailing)
            make.trailing.equalTo(sheet.snp.trailing)
            make.bottom.equalTo(vDivider.snp.bottom)
        }
    }
}
