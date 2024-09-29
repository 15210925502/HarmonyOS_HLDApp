import { abilityAccessCtrl, bundleManager, Permissions } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

@Entry
@Component
struct PictureImagePage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button('获取权限')
        .onClick(() => {
          this.requestPermissions(['ohos.permission.READ_IMAGEVIDEO', 'ohos.permission.WRITE_IMAGEVIDEO'])
        })
      Button('删除图片')
        .onClick(() => {
          this.example()
        })
    }
    .height('100%')
    .width('100%')
  }

  checkPermissions(permissions: Permissions[]) {
    const atManager = abilityAccessCtrl.createAtManager()
    const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
    const tokenID = bundleInfo.appInfo.accessTokenId
    const grantStatus = permissions.map(item => atManager.checkAccessTokenSync(tokenID, item))
    const isAuth = grantStatus.every(v => v === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
    return isAuth
  }

  async requestPermissions(permissions: Permissions[]) {
    const atManager = abilityAccessCtrl.createAtManager()
    const requestResult = await atManager.requestPermissionsFromUser(
      getContext(),
      permissions
    )
    const isAuth = requestResult.authResults.every(item => item == abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
    return isAuth == true ? Promise.resolve(true) : Promise.reject(false)
  }

  async example() {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOptions: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    try {
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await phAccessHelper.getAssets(fetchOptions);
      let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(getContext(), [asset.uri]);
      console.info('deleteAssets successfully');
    } catch (err) {
      console.error(`deleteAssetsDemo failed with error: ${err.code}, ${err.message}`);
    }
  }
}