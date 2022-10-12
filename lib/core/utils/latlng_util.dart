// This is required dus to api considers a round globe (with coordinates "overflow")
// whereas current lib flutter_map, is limited to normal range especifications
//
// Latitude [-90, 90]
// Longitude [-180, 180]
//

double normalizeLongitude(double long) {
  if (long > 180) {
    return 180;
  }
  if (long < -180) {
    return -180;
  }
  return long;
}

double normalizeLatitude(double long) {
  if (long > 180) {
    return 180;
  }
  if (long < -180) {
    return -180;
  }
  return long;
}
