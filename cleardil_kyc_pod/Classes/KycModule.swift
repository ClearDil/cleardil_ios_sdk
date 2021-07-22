import Flutter
import FlutterPluginRegistrant

public class KycModule {
    
    var SDK_TOKEN_CHANNEL: String = "cleardil.sdk/kyc.channel";
    
    var _flutterEngine : FlutterEngine?
    var _flutterViewController: FlutterViewController?
    var _sdkToken: String?
    var documentType: [AllowedDocument]
    
    init(sdkToken: String, documentType: [AllowedDocument]) {
        self._sdkToken=sdkToken;
        self.documentType=documentType;
    }
    
    public func start(_ view: UIViewController) {
        self._flutterEngine = FlutterEngine(name: "com.cleardil.kyc.sdk", project: nil)
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
                self.retreiveSdkToken();
            } else if(call.method == "getListDocuments"){
                result(self.listDocumentToStr());
            } else {
                print("Unrecognized method name: \(call.method)")
          }
            return
        })
        view.show(_flutterViewController!,sender:self);
    }
    
    public func retreiveSdkToken(){
        print("success call handling");
    }
    
    func listDocumentToStr()->String{
        var listToString="";
        self.documentType.forEach{ doc in listToString = listToString + ";" + doc.rawValue;};
        return listToString;
    }
    
    public func setSdkToken(_ sdkToken: String){
        self._sdkToken=sdkToken;
    }
    
    
    public enum AllowedDocument: String {
        case IdentityCard = "NATIONAL_ID_CARD"
        case Passport="PASSPORT"
        case DriverLicense="DRIVERS_LICENSE"
    }
}
