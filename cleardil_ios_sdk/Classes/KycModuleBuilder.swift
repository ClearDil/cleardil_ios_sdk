//
//  KycModuleBuilder.swift
//  TestEmb3

import Foundation

public class KycModuleBuilder {

    private var _sdkToken: String?
    private var _verification: Bool?
    private var _documentType: [KycModule.AllowedDocument]?
    private var _env: KycModule.Environment?
    
    public init (){
        _documentType = [];
        _verification = false;
    }

    public func withSdkToken(sdkToken: String) ->KycModuleBuilder{
        _sdkToken = sdkToken;
        return self;
    }
    
    public func allowPassport() -> KycModuleBuilder{
        self._documentType?.append(KycModule.AllowedDocument.Passport);
        return self;
    }

    public func allowIdentityCard() -> KycModuleBuilder{
        self._documentType?.append(KycModule.AllowedDocument.IdentityCard);
        return self;
    }

    public func allowDriverLicense() -> KycModuleBuilder{
        self._documentType?.append(KycModule.AllowedDocument.DriverLicense);
        return self;
    }
    
    public func withEnvironment(env: KycModule.Environment) -> KycModuleBuilder{
        self._env = env;
        return self;
    }
    
    public func withVerification() -> KycModuleBuilder{
        self._verification = true;
        return self;
    }

    public func build()-> KycModule{
        let module: KycModule
        module = KycModule(sdkToken: self._sdkToken!, documentType:self._documentType!, env: self._env!, verification: self._verification!);
        return module;
    }

}
