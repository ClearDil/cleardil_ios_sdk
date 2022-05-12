import Flutter
import FlutterPluginRegistrant

public class KycModule {
    
    var SDK_TOKEN_CHANNEL: String = "cleardil.sdk/kyc.channel";
    var SDK_ENGINE_NAME: String = "kyc_sdk_engine";
    
    var _flutterEngine : FlutterEngine?
    var _flutterViewController: FlutterViewController?
    var _env: Environment?
    var _sdkToken: String?
    var _verification: Bool?
    var documentType: [AllowedDocument]
    
    init(sdkToken: String, documentType: [AllowedDocument], env: Environment, verification: Bool) {
        self._sdkToken=sdkToken;
        self.documentType=documentType;
        self._env=env;
        self._verification=verification;
    }
    
    public func start(_ view: UIViewController) {
        self._flutterEngine = FlutterEngine(name: SDK_ENGINE_NAME, project: nil)
        self._flutterEngine?.run(withEntrypoint: nil)
        GeneratedPluginRegistrant.register(with: self._flutterEngine!)
        if let flutterEngine = self._flutterEngine {
            self._flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        }
        let sdkTokenChannel = FlutterMethodChannel(name: SDK_TOKEN_CHANNEL,
                                                   binaryMessenger: self._flutterViewController!.binaryMessenger)
        sdkTokenChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if(call.method == "getSdkToken"){
                result(self.retreiveSdkToken());
            } else if(call.method == "getListDocuments"){
                result(self.listDocumentToStr());
            } else if(call.method == "getEnvironment"){
                result(self.getEnvironment());
            } else if(call.method == "getVerification"){
                result(self._verification);
            } else {
                print("Unrecognized method name: \(call.method)")
          }
            return
        })
        view.show(_flutterViewController!,sender:self);
    }
    
    public func retreiveSdkToken() ->String{
        var sdkToken = "some-sdk-token";
        sdkToken = self._sdkToken!;
        return sdkToken;
    }
    
    func listDocumentToStr()->String{
        var listToString="";
        self.documentType.forEach{ doc in listToString = listToString + ";" + doc.rawValue;};
        return listToString;
    }
    
    func getEnvironment()->String{
        var env=Environment.SANDBOX;
        if(self._env != nil) {
            env = self._env!;
        }
        return env.rawValue;
    }
    
    public func setSdkToken(_ sdkToken: String){
        self._sdkToken=sdkToken;
    }
    
    public enum AllowedDocument: String {
        case IdentityCard = "NATIONAL_ID_CARD"
        case Passport = "PASSPORT"
        case DriverLicense = "DRIVING_LICENSE"
    }
    
    public enum Environment: String {
        case PROD = "PROD"
        case SANDBOX = "SANDBOX"
        case DEMO = "DEMO"
    }
}
