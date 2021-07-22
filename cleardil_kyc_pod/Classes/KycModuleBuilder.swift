//
//  KycModuleBuilder.swift
//  TestEmb3

import Foundation

public class KycModuleBuilder {

    private var _sdkToken: String?
    private var _documentType: [KycModule.AllowedDocument]?
    
    public init (){
        _documentType = []
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

    public func build()-> KycModule{
        let module: KycModule
        module = KycModule(sdkToken: self._sdkToken!, documentType:self._documentType!);
        return module;
    }

}
