//
//  PropertyItem.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation

struct PropertyItem: Codable {
    let advertisementId: Int //116237026,
    let score: Double //1.0,
    let agencyId: String //"q027x",
    let title: String //"neu renovierte 3-Zimmer Wohnung",
    let street: String //"Käppeligasse 6",
    let zip: String //"4125",
    let text: String //"Riehen",
    let city: String //"Riehen",
    let country: String //"CH",
    let geoLocation: String //"7.6559072,47.5940580",
    let offerType: String //"RENT",
    let objectCategory: String //"APPT",
    let objectType: Int //1,
    let numberRooms: Double? //3.0,
    let floor: Int? //2,
    let surfaceLiving: Int? //85,
    let surfaceUsable: Int? //85,
    let currency: String //"CHF",
    let sellingPrice: Int? //1690,
    let price: Int? //1690,
    let priceUnit: String //"MONTHLY",
    let timestamp: Int //1536150995369,
    let timestampStr: String //"05.09.2018",
    let balcony: Bool? //true,
    let lastModified: Int //1536150995369,
    let searchInquiryTimestamp: Int //1532936170000,
    let picFilename1Small: String//"https://uat.homegate.ch/www/ftp/q027x/images/0001466.jpg/s/75/75",
    let picFilename1Medium: String//"https://uat.homegate.ch/www/ftp/q027x/images/0001466.jpg/s/187/187",
    let pictures: [String]
    let objectTypeLabel: String //"Wohnung",
    let countryLabel: String //"Schweiz",
    let floorLabel: String? //"2. Etage",
    let description: String //" neu renovierte Wohnung sep. WC / Bad, Kellerabteil + Estrichabteil, grosse Räume, Einbauschrank Velokeller vorhanden gute Anbindung an ÖV let inkaufsmöglichkeiteni//n Fussdistanz ",
    let listingType: String //"TOP",
    let agencyLogoUrl: String? //"https://uat.homegate.ch/neutral/img/logos/l_q027.gif",
    let agencyPhoneDay: String //"061 606 60 84",
    let contactPerson: String //"Flavia Gentili",
    let contactPhone: String //"061 606 60 84",
    let interestedFormType: Int//2,
    let externalUrls: [ExternalUrls]?
    let picFilename1: String //"https://uat.homegate.ch/www/ftp/q027x/images/0001466.jpg"
}


