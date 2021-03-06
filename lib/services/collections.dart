// Add or Delete from Favourites or Recommendations, Add to History 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/loginController.dart';

class Collections 
{
  final databaseReference = Firestore.instance;

  String userID = LoginModel.userID;
  String emailID = LoginModel.emailID;
  
  addToFavourites(Destination d) async {

  await databaseReference.collection("users")
      .document(userID).collection("favourites").document(d.city)
      .setData({
        'city': d.city,
        'country': d.country,
        'temperature': d.temperature,
        'exchangeRate': d.exchangeRate,
        'currency': d.currency,
        'favourite': d.favourite,
        'imageURL': d.imageURL,
        'Bucket_Adventure': d.bucketAdventure,
        'Bucket_Calm_Atmosphere': d.bucketCalmAtmosphere,
        'Bucket_Coastal_Landscape': d.bucketCoastalLandscape,
        'Bucket_Entertainment': d.bucketEntertainment,
        'Bucket_Landmark': d.bucketLandmark,
        'Bucket_Vibrant_Atmosphere': d.bucketVibrantAtmosphere,
        'Bucket_Urban_Landscape': d.bucketUrbanLandscape,
        'Bucket_Mountainous_Landscape': d.bucketMountainousLandscape,
        'Bucket_Historical_Architecture': d.bucketHistoricalArchitecture,
        'CityId' : d.cityID
      }
    ); 
  }

  deleteFromFavourites(Destination d) {
    try {
      databaseReference
          .collection("users")
          .document(userID).collection("favourites").document(d.city)
          .delete();
    } catch (e) {
      print(e.toString());
      }
    }

    deleteAllHistoryData() async {
      await databaseReference.collection("users").document(userID)
          .collection('history').getDocuments().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.documents){
          ds.reference.delete();}
        });
    }

  deleteAllFavouritesData() async {
    await databaseReference.collection("users").document(userID)
        .collection('favourites').getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();}
    });
  }

  deleteAllDestinationsData() async {
    await databaseReference.collection("users").document(userID)
        .collection('travelDestinations').getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();}
    });
  }

  Future<List<Destination>> getFavouritesData() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("users").document(userID).collection("favourites")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

        snapshot.documents.forEach((d) => 

            travelDestinations.add(
            Destination(
              city: d['city'], 
              country: d['country'], 
              favourite: d['favourite'], 
              temperature: d['temperature'], 
              exchangeRate: d['exchangeRate'], 
              currency: d['currency'], 
              imageURL: d['imageURL'],
              cityID: d['CityId'])
            )     
          ); 
        }
      ); 
    return travelDestinations; 
  }

  addToHistory(Destination d) async {

    await databaseReference.collection("users")
        .document(userID).collection("history").document(d.city)
        .setData({
      'city': d.city,
      'country': d.country,
      'temperature': d.temperature,
      'exchangeRate': d.exchangeRate,
      'currency': d.currency,
      'favourite': d.favourite,
      'imageURL': d.imageURL,
      'Bucket_Adventure': d.bucketAdventure,
      'Bucket_Calm_Atmosphere': d.bucketCalmAtmosphere,
      'Bucket_Coastal_Landscape': d.bucketCoastalLandscape,
      'Bucket_Entertainment': d.bucketEntertainment,
      'Bucket_Landmark': d.bucketLandmark,
      'Bucket_Vibrant_Atmosphere': d.bucketVibrantAtmosphere,
      'Bucket_Urban_Landscape': d.bucketUrbanLandscape,
      'Bucket_Mountainous_Landscape': d.bucketMountainousLandscape,
      'Bucket_Historical_Architecture': d.bucketHistoricalArchitecture,
      'CityId': d.cityID
      }
    );

    try {
      await databaseReference
          .collection("users")
          .document(userID).collection("travelDestinations").document(d.city)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  removeFromUserList(Destination d) async {
    try {
      await databaseReference
          .collection("users")
          .document(userID).collection("travelDestinations").document(d.city)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Destination>> getHistoryData() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("users").document(userID).collection("history")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

        snapshot.documents.forEach((d) => 

            travelDestinations.add(
            Destination(
              city: d['city'], 
              country: d['country'], 
              favourite: d['favourite'], 
              temperature: d['temperature'], 
              exchangeRate: d['exchangeRate'], 
              currency: d['currency'], 
              imageURL: d['imageURL'],
              bucketAdventure: d['Bucket_Adventure'],
                bucketCalmAtmosphere: d['Bucket_Calm_Atmosphere'],
                bucketCoastalLandscape: d['Bucket_Coastal_Landscape'],
                bucketEntertainment: d['Bucket_Entertainment'],
                bucketLandmark: d['Bucket_Landmark'],
                bucketVibrantAtmosphere: d['Bucket_Vibrant_Atmosphere'],
                bucketUrbanLandscape: d['Bucket_Urban_Landscape'],
                bucketMountainousLandscape: d['Bucket_Mountainous_Landscape'],
                bucketHistoricalArchitecture: d['Bucket_Historical_Architecture'],
                cityID: d['CityId'])
            )     
          ); 
        }
      ); 
    
    return travelDestinations; 
  }

  updateHistoryFavourite(Destination d, bool fav) async {

    await databaseReference.collection("users")
        .document(userID).collection("history").document(d.city)
        .updateData({
      'favourite': fav,
      }
    );
  }

  updateRecommendationFavourite(Destination d, bool fav) async {

    await databaseReference.collection("users")
        .document(userID).collection("history").document(d.city)
        .updateData({
      'favourite': fav,
      }
    );
  }

  getDestinations(String userID) async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("travel_destination")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

      snapshot.documents.forEach((d) =>

          travelDestinations.add(
              Destination(
                  city: d['City'],
                  country: d['Country'],
                  currency: d['Currency'],
                  imageURL: d['image'],
                  bucketAdventure: d['Bucket_Adventure'],
                  bucketCalmAtmosphere: d['Bucket_Calm_Atmosphere'],
                  bucketCoastalLandscape: d['Bucket_Coastal_Landscape'],
                  bucketEntertainment: d['Bucket_Entertainment'],
                  bucketLandmark: d['Bucket_Landmark'],
                  bucketVibrantAtmosphere: d['Bucket_Vibrant_Atmosphere'],
                  bucketUrbanLandscape: d['Bucket_Urban_Landscape'],
                  bucketMountainousLandscape: d['Bucket_Mountainous_Landscape'],
                  bucketHistoricalArchitecture: d['Bucket_Historical_Architecture'],
                  tag1: d['Tag1'],
                  tag2: d['Tag2'],
                  tag3: d['Tag3'],
                  cityID: d['CityId']))
            );
          }
        );

    for(int i=0; i<travelDestinations.length; i++){
      
      await databaseReference.collection("users")
          .document(userID).collection("travelDestinations").document(travelDestinations[i].city)
          .setData({
          'City': travelDestinations[i].city,
          'Country': travelDestinations[i].country,
          'Currency': travelDestinations[i].currency,
          'image': travelDestinations[i].imageURL,
          'Bucket_Adventure': travelDestinations[i].bucketAdventure,
          'Bucket_Calm_Atmosphere': travelDestinations[i].bucketCalmAtmosphere,
          'Bucket_Coastal_Landscape': travelDestinations[i].bucketCoastalLandscape,
          'Bucket_Entertainment': travelDestinations[i].bucketEntertainment,
          'Bucket_Landmark': travelDestinations[i].bucketLandmark,
          'Bucket_Vibrant_Atmosphere': travelDestinations[i].bucketVibrantAtmosphere,
          'Bucket_Urban_Landscape': travelDestinations[i].bucketUrbanLandscape,
          'Bucket_Mountainous_Landscape': travelDestinations[i].bucketMountainousLandscape,
          'Bucket_Historical_Architecture': travelDestinations[i].bucketHistoricalArchitecture,
          'Tag1': travelDestinations[i].tag1,
          'Tag2': travelDestinations[i].tag2,
          'Tag3': travelDestinations[i].tag3,
          'CityId': travelDestinations[i].cityID});
      }
  }

  getResetDestinations() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("travel_destination")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

      snapshot.documents.forEach((d) =>

          travelDestinations.add(
              Destination(
                  city: d['City'],
                  country: d['Country'],
                  currency: d['Currency'],
                  imageURL: d['image'],
                  bucketAdventure: d['Bucket_Adventure'],
                  bucketCalmAtmosphere: d['Bucket_Calm_Atmosphere'],
                  bucketCoastalLandscape: d['Bucket_Coastal_Landscape'],
                  bucketEntertainment: d['Bucket_Entertainment'],
                  bucketLandmark: d['Bucket_Landmark'],
                  bucketVibrantAtmosphere: d['Bucket_Vibrant_Atmosphere'],
                  bucketUrbanLandscape: d['Bucket_Urban_Landscape'],
                  bucketMountainousLandscape: d['Bucket_Mountainous_Landscape'],
                  bucketHistoricalArchitecture: d['Bucket_Historical_Architecture'],
                  tag1: d['Tag1'],
                  tag2: d['Tag2'],
                  tag3: d['Tag3'],
                  cityID: d['CityId']))
              );
          } 
      );

    for(int i=0; i<travelDestinations.length; i++){
      
      await databaseReference.collection("users")
          .document(userID).collection("travelDestinations").document(travelDestinations[i].city)
          .setData({

        'City': travelDestinations[i].city,
        'Country': travelDestinations[i].country,
        'Currency': travelDestinations[i].currency,
        'image': travelDestinations[i].imageURL,
        'Bucket_Adventure': travelDestinations[i].bucketAdventure,
        'Bucket_Calm_Atmosphere': travelDestinations[i].bucketCalmAtmosphere,
        'Bucket_Coastal_Landscape': travelDestinations[i].bucketCoastalLandscape,
        'Bucket_Entertainment': travelDestinations[i].bucketEntertainment,
        'Bucket_Landmark': travelDestinations[i].bucketLandmark,
        'Bucket_Vibrant_Atmosphere': travelDestinations[i].bucketVibrantAtmosphere,
        'Bucket_Urban_Landscape': travelDestinations[i].bucketUrbanLandscape,
        'Bucket_Mountainous_Landscape': travelDestinations[i].bucketMountainousLandscape,
        'Bucket_Historical_Architecture': travelDestinations[i].bucketHistoricalArchitecture,
        'Tag1': travelDestinations[i].tag1,
        'Tag2': travelDestinations[i].tag2,
        'Tag3': travelDestinations[i].tag3,
        'CityId': travelDestinations[i].cityID
        }
      );
    }
  }

  Future<List<Destination>> getUserDestinations() async {
    
    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("users").document(userID).collection("travelDestinations")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      
      snapshot.documents.forEach((d) =>

          travelDestinations.add(
              Destination(
                  city: d['City'],
                  country: d['Country'],
                  currency: d['Currency'],
                  imageURL: d['image'],
                  bucketAdventure: d['Bucket_Adventure'],
                  bucketCalmAtmosphere: d['Bucket_Calm_Atmosphere'],
                  bucketCoastalLandscape: d['Bucket_Coastal_Landscape'],
                  bucketEntertainment: d['Bucket_Entertainment'],
                  bucketLandmark: d['Bucket_Landmark'],
                  bucketVibrantAtmosphere: d['Bucket_Vibrant_Atmosphere'],
                  bucketUrbanLandscape: d['Bucket_Urban_Landscape'],
                  bucketMountainousLandscape: d['Bucket_Mountainous_Landscape'],
                  bucketHistoricalArchitecture: d['Bucket_Historical_Architecture'],
                  tag1: d['Tag1'],
                  tag2: d['Tag2'],
                  tag3: d['Tag3'],
                  cityID: d['CityId']
                )
              ),
            );
          }
        );

    List<Destination> preferredDestinations = [];
    List<Destination> remainingDestinations = [];

    String userBucketTag = await getBucketTag();
    
    for(int i=0; i<travelDestinations.length; i++){

      if(travelDestinations[i].bucketAdventure == true && userBucketTag=='Bucket_Adventure')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketCalmAtmosphere == true && userBucketTag=='Bucket_Calm_Atmosphere')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketCoastalLandscape == true && userBucketTag=='Bucket_Coastal_Landscape')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketLandmark == true && userBucketTag=='Bucket_Landmark')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketVibrantAtmosphere == true && userBucketTag=='Bucket_Vibrant_Atmosphere')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketUrbanLandscape == true && userBucketTag=='Bucket_Urban_Landscape')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketMountainousLandscape == true && userBucketTag=='Bucket_Mountainous_Landscape')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketHistoricalArchitecture == true && userBucketTag=='Bucket_Historical_Architecture')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else if(travelDestinations[i].bucketEntertainment == true && userBucketTag=='Bucket_Entertainment')
      {
        preferredDestinations.add(travelDestinations[i]);
      }
      else{
        remainingDestinations.add(travelDestinations[i]);
      }
    }

    preferredDestinations.addAll(remainingDestinations);

    return preferredDestinations;
  }

  createBucketTag() async{
    
    await databaseReference.collection("users")
      .document(userID)
      .setData({
        'Bucket_Preference': ' '
      });
  }

  updateBucketTag(String btag) async{
    
    try{
      databaseReference.collection("users")
      .document(userID)
      .updateData({
        'Bucket_Preference': btag
      });
    }
    catch(e) {}
  }

  getBucketTag() async {

    String bucketTag;
    await databaseReference.collection('users').document(userID)
        .get()
        .then((DocumentSnapshot snapshot) {
      bucketTag = snapshot['Bucket_Preference'];
      });

    return bucketTag;
  }

  Future<List<String>> getUserInfo() async{
    
    List<String> userInfo = [];
    String firstame, lastname, name;

    await databaseReference.collection('users').document(userID)
        .get()
        .then((DocumentSnapshot snapshot) {
      firstame = snapshot.data['firstame'];
      lastname = snapshot.data['lastname'];
    });

    name = firstame + ' ' + lastname;
    userInfo.add(name); 
    userInfo.add(emailID);

    // userInfo = ['Name', 'EmailID']
    return userInfo;
  }

}