import 'package:groundapp/model/ground.dart';

final List<Ground> dummyGrounds = [
  Ground(
    id: 1,
    name: 'Green Field',
    location: 'Bangalore',
    type: 'Football',
    imgUrl:
        'https://images.unsplash.com/photo-1570498839593-e565b39455fc?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    availableSlots: ['9.00 AM', '10.00 AM', '11:00 AM'],
    description:
        'A well-maintained football ground with artificial turf and floodlights. Perfect for team practice and tournaments.',
  ),

  Ground(
    id: 2,
    name: 'Blue Turf',
    location: 'Mumbai',
    type: 'Cricket',
    imgUrl:
        'https://as2.ftcdn.net/v2/jpg/04/48/70/33/1000_F_448703360_Yl1j5l882016Uzmo52mqGx2eu9h07Apt.jpg',
    availableSlots: ['8.00 AM', '9:30 AM', '11:00 AM'],
    description:
        'A synthetic cricket turf ground with net practice area, ideal for matches and coaching sessions.',
  ),
  Ground(
    id: 3,
    name: 'Skyline Court',
    location: 'Delhi',
    type: 'Badminton',
    imgUrl:
        'https://images.unsplash.com/photo-1721760886493-61c47c1caec9?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    availableSlots: ['7:00 AM', '8:30 AM', '11:00 AM'],
    description:
        'Indoor badminton court with proper ventilation and lighting, suitable for singles and doubles games.',
  ),
  Ground(
    id: 4,
    name: 'SpinServe Tennis Academy',
    location: 'Patna',
    type: 'Tennis',
    imgUrl:
        'https://plus.unsplash.com/premium_photo-1666913667082-c1fecc45275d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGVubmlzfGVufDB8fDB8fHww',
    availableSlots: ['6:00 AM', '7:30 AM', '9:00 AM'],
    description:
        'Premium clay and synthetic tennis courts with coaching for all age groups and skill levels.',
  ),
  Ground(
    id: 5,
    name: 'Urban Skate Park',
    location: 'Kolkata',
    type: 'Skating',
    imgUrl:
        'https://images.unsplash.com/photo-1612100389024-106c3cfdb7d0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHNrYXRpbmd8ZW58MHx8MHx8fDA%3D',
    availableSlots: ['5:00 AM', '6:30 AM', '8:00 AM'],
    description:
        'Modern skating area with ramps and rails for freestyle and speed skating, suitable for all age groups.',
  ),
  Ground(
    id: 6,
    name: 'Hoop Central',
    location: 'Chandigarh',
    type: 'Basketball',
    imgUrl:
        'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFza2V0YmFsbHxlbnwwfHwwfHx8MA%3D%3D',
    availableSlots: ['6:00 AM', '7:30 AM', '10:00 AM'],
    description:
        'Premium outdoor basketball court with acrylic flooring and floodlights, ideal for pickup games and training sessions.',
  ),
];
