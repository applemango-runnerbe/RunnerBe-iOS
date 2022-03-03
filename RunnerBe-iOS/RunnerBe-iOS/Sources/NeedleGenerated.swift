

import Foundation
import NeedleFoundation

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent") { component in
        return LoggedOutDependency2bcab0d3625f6f252479Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent") { component in
        return MainTabDependency2826cdb310ed0b17a725Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->BookMarkComponent") { component in
        return BookMarkDependency0c4e86716ba3aaf84ee1Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->LicenseComponent") { component in
        return LicenseDependency069aaa9d3342e7e55e4dProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->LogoutModalComponent") { component in
        return LogoutModalDependency198c1460728f9b03415bProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent") { component in
        return SettingsDependency70ef32136cd1f498fcc9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->MakerComponent") { component in
        return MakerDependency5de256f346c664613971Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->EditInfoComponent->TakePhotoModalComponent") { component in
        return TakePhotoModalDependency2ab17d3ee2a92e0abadfProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->EditInfoComponent->NickNameChangeModalComponent") { component in
        return NickNameChangeModalDependencyb35b5747f04ee5549ecdProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->EditInfoComponent") { component in
        return EditInfoDependency226a6a95833dbef9e88dProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent") { component in
        return MyPageDependencyed3a2dbc57f299854a2fProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent->WritingDetailPostComponent") { component in
        return WritingDetailPostDependencyb2348cad5787e6e17e92Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent->WritingDetailPostComponent") { component in
        return WritingDetailPostDependencybef9fe2df3caa6a55869Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent->SelectTimeModalComponent") { component in
        return SelectTimeModalDependency81aed5a40c91d94b031eProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent->SelectTimeModalComponent") { component in
        return SelectTimeModalDependencyd8ded48eb82c59809282Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent") { component in
        return WritingMainPostDependencya65ab5df0fc9f777cbeaProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent") { component in
        return WritingMainPostDependencyeba8c3d3228ba588faa8Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent->SelectDateModalComponent") { component in
        return SelectDateModalDependency48c6d7ac20300654ff5cProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent->SelectDateModalComponent") { component in
        return SelectDateModalDependency547a4536ad6f1082ff72Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->BookMarkComponent->PostDetailComponent->ApplicantListModalComponent") { component in
        return ApplicantListModalDependency04cfed02b61183a240faProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->PostDetailComponent->ApplicantListModalComponent") { component in
        return ApplicantListModalDependency369da0b8761222e1dadaProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->PostDetailComponent->ApplicantListModalComponent") { component in
        return ApplicantListModalDependency38daf10a5dd5609ffa27Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->BookMarkComponent->PostDetailComponent") { component in
        return PostDetailDependencyefc8ed9cd9a796bab512Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->PostDetailComponent") { component in
        return PostDetailDependencyfaba91a453a4115aa8d1Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->PostDetailComponent") { component in
        return PostDetailDependency0e20bfa0f3e155bd15e3Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent->HomeFilterComponent") { component in
        return HomeFilterDependency4c2395ae43750f0e6394Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->HomeComponent") { component in
        return HomeDependency69aec7ecd6b5263bd0e9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent") { component in
        return PolicyTermDependency28006fce607070d6ca75Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->PolicyDetailComponent") { component in
        return PolicyDetailDependencyf1b0f14079b572bc52b9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->PolicyDetailComponent") { component in
        return PolicyDetailDependencyab7a37b72bd8b136a461Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent->WaitCertificationComponent") { component in
        return WaitCertificationDependencya59e7f4494bb58452d1aProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->OnboardingCompletionComponent") { component in
        return OnboardingCompletionDependencyfab662889368f161b644Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent") { component in
        return PhotoCertificationDependency919976e3bbe7c6970accProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent->PhotoModalComponent") { component in
        return PhotoModalDependency256710ef3f831e315f20Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent") { component in
        return EmailCertificationDependencyf5f9a83429ebc20c0ea9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->EmailCertificationInitModalComponent") { component in
        return EmailCertificationInitModalDependencyc0fcd95426abdc2eb784Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent") { component in
        return BirthDependencyeacd7a6dc893684c63a8Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->OnboardingCancelModalComponent") { component in
        return OnboardingCancelModalDependency163a186c00ad3225b79bProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent->OnboardingCancelModalComponent") { component in
        return OnboardingCancelModalDependency680f661d1573dc6db5cbProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->OnboardingCancelModalComponent") { component in
        return OnboardingCancelModalDependency41086b612da017603ac7Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->OnboardingCancelModalComponent") { component in
        return OnboardingCancelModalDependencyd5d244529412faa64d91Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->OnboardingCancelModalComponent") { component in
        return OnboardingCancelModalDependencycb42558bc283046b72a5Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->OnboardingCancelModalComponent") { component in
        return OnboardingCancelModalDependency07be119931b373c0743bProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent") { component in
        return SelectJobGroupDependency2420d5f31bd0022c257fProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent") { component in
        return SelectGenderDependency1501a6b74f78c8951e52Provider(component: component)
    }
    
}

// MARK: - Providers

private class LoggedOutDependency2bcab0d3625f6f252479BaseProvider: LoggedOutDependency {
    var loginService: LoginService {
        return appComponent.loginService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LoggedOutComponent
private class LoggedOutDependency2bcab0d3625f6f252479Provider: LoggedOutDependency2bcab0d3625f6f252479BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent as! AppComponent)
    }
}
private class MainTabDependency2826cdb310ed0b17a725BaseProvider: MainTabDependency {
    var loginService: LoginService {
        return appComponent.loginService
    }
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency2826cdb310ed0b17a725BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent as! AppComponent)
    }
}
private class BookMarkDependency0c4e86716ba3aaf84ee1BaseProvider: BookMarkDependency {
    var postAPIService: PostAPIService {
        return mainTabComponent.postAPIService
    }
    private let mainTabComponent: MainTabComponent
    init(mainTabComponent: MainTabComponent) {
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->BookMarkComponent
private class BookMarkDependency0c4e86716ba3aaf84ee1Provider: BookMarkDependency0c4e86716ba3aaf84ee1BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent as! MainTabComponent)
    }
}
private class LicenseDependency069aaa9d3342e7e55e4dBaseProvider: LicenseDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->LicenseComponent
private class LicenseDependency069aaa9d3342e7e55e4dProvider: LicenseDependency069aaa9d3342e7e55e4dBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class LogoutModalDependency198c1460728f9b03415bBaseProvider: LogoutModalDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->LogoutModalComponent
private class LogoutModalDependency198c1460728f9b03415bProvider: LogoutModalDependency198c1460728f9b03415bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class SettingsDependency70ef32136cd1f498fcc9BaseProvider: SettingsDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent
private class SettingsDependency70ef32136cd1f498fcc9Provider: SettingsDependency70ef32136cd1f498fcc9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class MakerDependency5de256f346c664613971BaseProvider: MakerDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->MakerComponent
private class MakerDependency5de256f346c664613971Provider: MakerDependency5de256f346c664613971BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class TakePhotoModalDependency2ab17d3ee2a92e0abadfBaseProvider: TakePhotoModalDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->EditInfoComponent->TakePhotoModalComponent
private class TakePhotoModalDependency2ab17d3ee2a92e0abadfProvider: TakePhotoModalDependency2ab17d3ee2a92e0abadfBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class NickNameChangeModalDependencyb35b5747f04ee5549ecdBaseProvider: NickNameChangeModalDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->EditInfoComponent->NickNameChangeModalComponent
private class NickNameChangeModalDependencyb35b5747f04ee5549ecdProvider: NickNameChangeModalDependencyb35b5747f04ee5549ecdBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class EditInfoDependency226a6a95833dbef9e88dBaseProvider: EditInfoDependency {
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->EditInfoComponent
private class EditInfoDependency226a6a95833dbef9e88dProvider: EditInfoDependency226a6a95833dbef9e88dBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent as! AppComponent)
    }
}
private class MyPageDependencyed3a2dbc57f299854a2fBaseProvider: MyPageDependency {
    var postAPIService: PostAPIService {
        return mainTabComponent.postAPIService
    }
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var locationService: LocationService {
        return mainTabComponent.locationService
    }
    var loginService: LoginService {
        return appComponent.loginService
    }
    private let appComponent: AppComponent
    private let mainTabComponent: MainTabComponent
    init(appComponent: AppComponent, mainTabComponent: MainTabComponent) {
        self.appComponent = appComponent
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent
private class MyPageDependencyed3a2dbc57f299854a2fProvider: MyPageDependencyed3a2dbc57f299854a2fBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent as! AppComponent, mainTabComponent: component.parent as! MainTabComponent)
    }
}
private class WritingDetailPostDependencyb2348cad5787e6e17e92BaseProvider: WritingDetailPostDependency {
    var postAPIService: PostAPIService {
        return mainTabComponent.postAPIService
    }
    var loginService: LoginService {
        return appComponent.loginService
    }
    private let appComponent: AppComponent
    private let mainTabComponent: MainTabComponent
    init(appComponent: AppComponent, mainTabComponent: MainTabComponent) {
        self.appComponent = appComponent
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent->WritingDetailPostComponent
private class WritingDetailPostDependencyb2348cad5787e6e17e92Provider: WritingDetailPostDependencyb2348cad5787e6e17e92BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent.parent as! AppComponent, mainTabComponent: component.parent.parent.parent as! MainTabComponent)
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent->WritingDetailPostComponent
private class WritingDetailPostDependencybef9fe2df3caa6a55869Provider: WritingDetailPostDependencyb2348cad5787e6e17e92BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent.parent as! AppComponent, mainTabComponent: component.parent.parent.parent as! MainTabComponent)
    }
}
private class SelectTimeModalDependency81aed5a40c91d94b031eBaseProvider: SelectTimeModalDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent->SelectTimeModalComponent
private class SelectTimeModalDependency81aed5a40c91d94b031eProvider: SelectTimeModalDependency81aed5a40c91d94b031eBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent->SelectTimeModalComponent
private class SelectTimeModalDependencyd8ded48eb82c59809282Provider: SelectTimeModalDependency81aed5a40c91d94b031eBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class WritingMainPostDependencya65ab5df0fc9f777cbeaBaseProvider: WritingMainPostDependency {
    var locationService: LocationService {
        return mainTabComponent.locationService
    }
    var loginService: LoginService {
        return appComponent.loginService
    }
    private let appComponent: AppComponent
    private let mainTabComponent: MainTabComponent
    init(appComponent: AppComponent, mainTabComponent: MainTabComponent) {
        self.appComponent = appComponent
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent
private class WritingMainPostDependencya65ab5df0fc9f777cbeaProvider: WritingMainPostDependencya65ab5df0fc9f777cbeaBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent as! AppComponent, mainTabComponent: component.parent.parent as! MainTabComponent)
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent
private class WritingMainPostDependencyeba8c3d3228ba588faa8Provider: WritingMainPostDependencya65ab5df0fc9f777cbeaBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent as! AppComponent, mainTabComponent: component.parent.parent as! MainTabComponent)
    }
}
private class SelectDateModalDependency48c6d7ac20300654ff5cBaseProvider: SelectDateModalDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->WritingMainPostComponent->SelectDateModalComponent
private class SelectDateModalDependency48c6d7ac20300654ff5cProvider: SelectDateModalDependency48c6d7ac20300654ff5cBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->WritingMainPostComponent->SelectDateModalComponent
private class SelectDateModalDependency547a4536ad6f1082ff72Provider: SelectDateModalDependency48c6d7ac20300654ff5cBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class ApplicantListModalDependency04cfed02b61183a240faBaseProvider: ApplicantListModalDependency {
    var postAPIService: PostAPIService {
        return mainTabComponent.postAPIService
    }
    private let mainTabComponent: MainTabComponent
    init(mainTabComponent: MainTabComponent) {
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->BookMarkComponent->PostDetailComponent->ApplicantListModalComponent
private class ApplicantListModalDependency04cfed02b61183a240faProvider: ApplicantListModalDependency04cfed02b61183a240faBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent.parent as! MainTabComponent)
    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->PostDetailComponent->ApplicantListModalComponent
private class ApplicantListModalDependency369da0b8761222e1dadaProvider: ApplicantListModalDependency04cfed02b61183a240faBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent.parent as! MainTabComponent)
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->PostDetailComponent->ApplicantListModalComponent
private class ApplicantListModalDependency38daf10a5dd5609ffa27Provider: ApplicantListModalDependency04cfed02b61183a240faBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent.parent as! MainTabComponent)
    }
}
private class PostDetailDependencyefc8ed9cd9a796bab512BaseProvider: PostDetailDependency {
    var postAPIService: PostAPIService {
        return mainTabComponent.postAPIService
    }
    private let mainTabComponent: MainTabComponent
    init(mainTabComponent: MainTabComponent) {
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->BookMarkComponent->PostDetailComponent
private class PostDetailDependencyefc8ed9cd9a796bab512Provider: PostDetailDependencyefc8ed9cd9a796bab512BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent as! MainTabComponent)
    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->PostDetailComponent
private class PostDetailDependencyfaba91a453a4115aa8d1Provider: PostDetailDependencyefc8ed9cd9a796bab512BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent as! MainTabComponent)
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->PostDetailComponent
private class PostDetailDependency0e20bfa0f3e155bd15e3Provider: PostDetailDependencyefc8ed9cd9a796bab512BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent as! MainTabComponent)
    }
}
private class HomeFilterDependency4c2395ae43750f0e6394BaseProvider: HomeFilterDependency {
    var locationService: LocationService {
        return mainTabComponent.locationService
    }
    private let mainTabComponent: MainTabComponent
    init(mainTabComponent: MainTabComponent) {
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent->HomeFilterComponent
private class HomeFilterDependency4c2395ae43750f0e6394Provider: HomeFilterDependency4c2395ae43750f0e6394BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(mainTabComponent: component.parent.parent as! MainTabComponent)
    }
}
private class HomeDependency69aec7ecd6b5263bd0e9BaseProvider: HomeDependency {
    var loginService: LoginService {
        return appComponent.loginService
    }
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var postAPIService: PostAPIService {
        return mainTabComponent.postAPIService
    }
    var locationService: LocationService {
        return mainTabComponent.locationService
    }
    private let appComponent: AppComponent
    private let mainTabComponent: MainTabComponent
    init(appComponent: AppComponent, mainTabComponent: MainTabComponent) {
        self.appComponent = appComponent
        self.mainTabComponent = mainTabComponent
    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent
private class HomeDependency69aec7ecd6b5263bd0e9Provider: HomeDependency69aec7ecd6b5263bd0e9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent as! AppComponent, mainTabComponent: component.parent as! MainTabComponent)
    }
}
private class PolicyTermDependency28006fce607070d6ca75BaseProvider: PolicyTermDependency {
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var signupKeyChainService: SignupKeyChainService {
        return loggedOutComponent.signupKeyChainService
    }
    private let appComponent: AppComponent
    private let loggedOutComponent: LoggedOutComponent
    init(appComponent: AppComponent, loggedOutComponent: LoggedOutComponent) {
        self.appComponent = appComponent
        self.loggedOutComponent = loggedOutComponent
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent
private class PolicyTermDependency28006fce607070d6ca75Provider: PolicyTermDependency28006fce607070d6ca75BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent as! AppComponent, loggedOutComponent: component.parent as! LoggedOutComponent)
    }
}
private class PolicyDetailDependencyf1b0f14079b572bc52b9BaseProvider: PolicyDetailDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent->SettingsComponent->PolicyDetailComponent
private class PolicyDetailDependencyf1b0f14079b572bc52b9Provider: PolicyDetailDependencyf1b0f14079b572bc52b9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->PolicyDetailComponent
private class PolicyDetailDependencyab7a37b72bd8b136a461Provider: PolicyDetailDependencyf1b0f14079b572bc52b9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class WaitCertificationDependencya59e7f4494bb58452d1aBaseProvider: WaitCertificationDependency {


    init() {

    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent->WaitCertificationComponent
private class WaitCertificationDependencya59e7f4494bb58452d1aProvider: WaitCertificationDependencya59e7f4494bb58452d1aBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class OnboardingCompletionDependencyfab662889368f161b644BaseProvider: OnboardingCompletionDependency {


    init() {

    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->OnboardingCompletionComponent
private class OnboardingCompletionDependencyfab662889368f161b644Provider: OnboardingCompletionDependencyfab662889368f161b644BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class PhotoCertificationDependency919976e3bbe7c6970accBaseProvider: PhotoCertificationDependency {
    var signupService: SignupService {
        return emailCertificationComponent.signupService
    }
    private let emailCertificationComponent: EmailCertificationComponent
    init(emailCertificationComponent: EmailCertificationComponent) {
        self.emailCertificationComponent = emailCertificationComponent
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent
private class PhotoCertificationDependency919976e3bbe7c6970accProvider: PhotoCertificationDependency919976e3bbe7c6970accBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(emailCertificationComponent: component.parent as! EmailCertificationComponent)
    }
}
private class PhotoModalDependency256710ef3f831e315f20BaseProvider: PhotoModalDependency {


    init() {

    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent->PhotoModalComponent
private class PhotoModalDependency256710ef3f831e315f20Provider: PhotoModalDependency256710ef3f831e315f20BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class EmailCertificationDependencyf5f9a83429ebc20c0ea9BaseProvider: EmailCertificationDependency {
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var signupKeyChainService: SignupKeyChainService {
        return loggedOutComponent.signupKeyChainService
    }
    private let appComponent: AppComponent
    private let loggedOutComponent: LoggedOutComponent
    init(appComponent: AppComponent, loggedOutComponent: LoggedOutComponent) {
        self.appComponent = appComponent
        self.loggedOutComponent = loggedOutComponent
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent
private class EmailCertificationDependencyf5f9a83429ebc20c0ea9Provider: EmailCertificationDependencyf5f9a83429ebc20c0ea9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent.parent.parent.parent as! AppComponent, loggedOutComponent: component.parent.parent.parent.parent.parent as! LoggedOutComponent)
    }
}
private class EmailCertificationInitModalDependencyc0fcd95426abdc2eb784BaseProvider: EmailCertificationInitModalDependency {


    init() {

    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->EmailCertificationInitModalComponent
private class EmailCertificationInitModalDependencyc0fcd95426abdc2eb784Provider: EmailCertificationInitModalDependencyc0fcd95426abdc2eb784BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class BirthDependencyeacd7a6dc893684c63a8BaseProvider: BirthDependency {
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var signupKeyChainService: SignupKeyChainService {
        return loggedOutComponent.signupKeyChainService
    }
    private let appComponent: AppComponent
    private let loggedOutComponent: LoggedOutComponent
    init(appComponent: AppComponent, loggedOutComponent: LoggedOutComponent) {
        self.appComponent = appComponent
        self.loggedOutComponent = loggedOutComponent
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent
private class BirthDependencyeacd7a6dc893684c63a8Provider: BirthDependencyeacd7a6dc893684c63a8BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent as! AppComponent, loggedOutComponent: component.parent.parent as! LoggedOutComponent)
    }
}
private class OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider: OnboardingCancelModalDependency {


    init() {

    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->OnboardingCancelModalComponent
private class OnboardingCancelModalDependency163a186c00ad3225b79bProvider: OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->PhotoCertificationComponent->OnboardingCancelModalComponent
private class OnboardingCancelModalDependency680f661d1573dc6db5cbProvider: OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->EmailCertificationComponent->OnboardingCancelModalComponent
private class OnboardingCancelModalDependency41086b612da017603ac7Provider: OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->OnboardingCancelModalComponent
private class OnboardingCancelModalDependencyd5d244529412faa64d91Provider: OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent->OnboardingCancelModalComponent
private class OnboardingCancelModalDependencycb42558bc283046b72a5Provider: OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->OnboardingCancelModalComponent
private class OnboardingCancelModalDependency07be119931b373c0743bProvider: OnboardingCancelModalDependency163a186c00ad3225b79bBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class SelectJobGroupDependency2420d5f31bd0022c257fBaseProvider: SelectJobGroupDependency {
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var signupKeyChainService: SignupKeyChainService {
        return loggedOutComponent.signupKeyChainService
    }
    private let appComponent: AppComponent
    private let loggedOutComponent: LoggedOutComponent
    init(appComponent: AppComponent, loggedOutComponent: LoggedOutComponent) {
        self.appComponent = appComponent
        self.loggedOutComponent = loggedOutComponent
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent->SelectJobGroupComponent
private class SelectJobGroupDependency2420d5f31bd0022c257fProvider: SelectJobGroupDependency2420d5f31bd0022c257fBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent.parent.parent as! AppComponent, loggedOutComponent: component.parent.parent.parent.parent as! LoggedOutComponent)
    }
}
private class SelectGenderDependency1501a6b74f78c8951e52BaseProvider: SelectGenderDependency {
    var loginKeyChainService: LoginKeyChainService {
        return appComponent.loginKeyChainService
    }
    var signupKeyChainService: SignupKeyChainService {
        return loggedOutComponent.signupKeyChainService
    }
    private let appComponent: AppComponent
    private let loggedOutComponent: LoggedOutComponent
    init(appComponent: AppComponent, loggedOutComponent: LoggedOutComponent) {
        self.appComponent = appComponent
        self.loggedOutComponent = loggedOutComponent
    }
}
/// ^->AppComponent->LoggedOutComponent->PolicyTermComponent->BirthComponent->SelectGenderComponent
private class SelectGenderDependency1501a6b74f78c8951e52Provider: SelectGenderDependency1501a6b74f78c8951e52BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appComponent: component.parent.parent.parent.parent as! AppComponent, loggedOutComponent: component.parent.parent.parent as! LoggedOutComponent)
    }
}
