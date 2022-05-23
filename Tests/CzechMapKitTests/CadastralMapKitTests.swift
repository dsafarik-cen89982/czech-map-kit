import XCTest
import CoreLocation
@testable import CzechMapKit

@available(iOS 15.0.0, *)
final class CadastralMapKitTests: XCTestCase {
    
    func testFetchCadastralParcel() async throws {
        let sut = CadastreFetcher()
        let cp = await sut.fetchCadastralParcel(point: CLLocationCoordinate2D(latitude: CLLocationDegrees(49.30068), longitude: CLLocationDegrees(16.651604)))
        XCTAssertNotNil(cp?.geometry.Polygon.exterior?.LinearRing.posList)
    }
}
