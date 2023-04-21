import 'package:latlong2/latlong.dart';
import 'package:polaris/models/map_marker_model.dart';

class StopLocation {
  final LatLng? location;
  final List<MapMarker>? suggestion;

  StopLocation({
    required this.location,
    required this.suggestion,
  });
}

class Plan {
  final String? name;
  final LatLng? location;
  final List<StopLocation>? highStop;
  final List<StopLocation>? lowStop;

  Plan({
    required this.name,
    required this.location,
    required this.highStop,
    required this.lowStop,
  });
}

final listPlan = [
  Plan(
    name: "Vung Tau",
    location: LatLng(10.354827, 107.078681),
    lowStop: [
      StopLocation(
          location: LatLng(10.850645626937456, 106.85502493288660),
          suggestion: [
            MapMarker(
                image:
                    "https://lh5.googleusercontent.com/p/AF1QipM4IBTGT5EEV13oEUeMIN2sbFGvKcZwMPNdLwfD=w471-h240-k-no",
                title: 'Bun moc Thanh Mai',
                address:
                    '232 AH17, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Vietnam',
                location: LatLng(10.899645626937446, 106.85502493288655),
                rating: 4),
            MapMarker(
                image:
                    "https://cdn.batdongsan.com.vi/gpictures/500x250/2916/MnxBRjFRaXBOdXFKQTU4Y0NjZERlV25YT1drRXJ3b00wV19WTVQ0YXFPQlFKTg.jpg",
                title: 'Café Lan Anh',
                address: 'An Hòa, Bien Hoa, Dong Nai, Vietnam',
                location: LatLng(10.899259603661344, 106.8557143503907),
                rating: 5),
            MapMarker(
                image:
                    'https://lh5.googleusercontent.com/p/AF1QipPQ1Lwldj0eloI7LjMseGit7WiOjy6nWZKg1lth=w408-h306-k-no',
                title: 'Quan Oc 40',
                address:
                    '40A/11 Nguyễn Văn Tỏ, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Vietnam',
                location: LatLng(10.899343076369158, 106.85414270290813),
                rating: 4)
          ]),
      StopLocation(
          location: LatLng(10.50914547408520, 107.06406407136115),
          suggestion: [
            MapMarker(
                image:
                    "https://lh3.googleusercontent.com/ant03Pz2Ho2rL9ukWH4hpgceBMc-vfsajE7VzDVVnXbvPK_DRVxF0D1KlyA77MfM67FUTWhkKOw0FTc90SbtkbszrQgxJxSQ40E60s0",
                title: 'Quan Pho Nhu Y 50',
                address:
                    'QL51, Tân Phước, Tân Thành, Bà Rịa - Vũng Tàu, Vietnam',
                location: LatLng(10.559131629974212, 107.06409101449404),
                rating: 4),
            MapMarker(
                image:
                    "https://media.foody.vn/res/g8/72587/prof/s/foody-upload-api-foody-mobile-26-191219153556.jpg",
                title: 'Tra Sua CuBin',
                address: 'Cổng Núi, Tân Thành, Bà Rịa - Vũng Tàu, Vietnam',
                location: LatLng(10.559005064063408, 107.06458990535886),
                rating: 4),
            MapMarker(
                image:
                    "https://ngonngon.net/wp-content/uploads/200244004_945563339319897_8884167309597900131_n.jpg",
                title: 'Cafe 89',
                address: 'Tân Phước, Tân Thành, Bà Rịa - Vũng Tàu, Vietnam',
                location: LatLng(10.558693922644439, 107.06428681574745),
                rating: 4)
          ])
    ],
    highStop: [
      StopLocation(location: LatLng(10.7444078, 106.9378827), suggestion: [
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipNH-IV0YhlikGtdfALyipm1ONJ9IOoevHWLR8hD=w426-h240-k-no",
            title: 'Cafe Nhà Hàng Song Trang',
            address: 'Tổ 6 ấp xóm gò bà ký, Long Thành, Đồng Nai, Vietnam',
            location: LatLng(10.7444078, 106.9378827),
            rating: 4),
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipPrErmZruJ-2Jv5Npkn6mTlPCO5DsdSogCKIYQl=w480-h240-k-no",
            title: 'Vườn Cau Quán',
            address: 'P2J8+93Q, Long Phước, Long Thành, Đồng Nai, Vietnam',
            location: LatLng(10.6188233, 107.0586878),
            rating: 4),
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipONCxLwgv814rq7SrizvY1mM6zw0vCrsvMGFbmh=w408-h306-k-no",
            title: 'Bò sữa Long Thành 69',
            address: '1526 QL51, Phước Thái, Long Thành, Đồng Nai, Vietnam',
            location: LatLng(10.7993326, 107.170103),
            rating: 4)
      ]),
      StopLocation(location: LatLng(10.5340986, 107.1105937), suggestion: [
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipPz2yDeLq07ZAr4uwClejpZUMeCL7xdDomsCqXB=w408-h306-k-no",
            title: 'Thiền Viện Viên Không Tăng',
            address: 'Tóc Tiên, Tân Thành, Bà Rịa - Vũng Tàu, Vietnam',
            location: LatLng(10.557641612690809, 107.12226709599346),
            rating: 4),
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipOBwxhI4V7d8G3FTUrCEB4O7JKoGAjr3R9k5KZD=w408-h306-k-no",
            title: 'SUỐI ĐÁ',
            address: 'Tân Hải, Tân Thành, Bà Rịa - Vũng Tàu, Vietnam',
            location: LatLng(10.5340986, 107.1105937),
            rating: 4),
      ]),
      StopLocation(location: LatLng(10.5340986, 107.1105937), suggestion: [
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipNDkbbby2pjHCJNH2vSoALi_Z_xs_t6CDOf7jpe=w408-h725-k-no",
            title: 'Hải Đăng Church',
            address:
                'Phường 12, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu, Vietnam',
            location: LatLng(10.4470586, 107.1723475),
            rating: 4),
        MapMarker(
            image:
                "https://lh5.googleusercontent.com/p/AF1QipNPlHuGUVDUXi5UHtxC9rOUqoEuwdPUPyS_8W0Z=w408-h725-k-no",
            title: 'Mega Market Vũng Tàu',
            address:
                'QL51B, Phường 11, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu, Vietnam',
            location: LatLng(10.4470586, 107.1723475),
            rating: 4),
      ])
    ],
  )
];
