# CzechMapKit

CzechMapKit uses MapKit to create a `MKMapView` with an overlay showing the boundaries of a real-estate property identified by latitude and longitude coordinates. The boundaries are provided by Czech Republic's [State Administration of Land Surveying and Cadastre](https://cuzk.cz/en) public API.

## Example

```swift
import SwiftUI
import CzechMapKit

struct ContentView: View {
    
    var body: some View {
        CadastralMapView(midPoint: CLLocationCoordinate2D(latitude: CLLocationDegrees(49.30068), longitude: CLLocationDegrees(16.651604)))
    }
}
```
