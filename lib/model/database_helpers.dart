import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:iit_app/model/built_post.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:built_collection/built_collection.dart';

String workshopSummaryString = 'workshopSummary'; //*table name

String idString = 'id';
String clubIdString = 'clubId';
String clubString = 'club';
String councilIdString = 'councilId';
String smallImageUrlString = 'smallImageUrl';
String largeImageUrlString = 'largeImageUrl';
String titleString = 'title';
String dateString = 'date';
String timeString = 'time';
String interestedString = 'interested';

String allCouncislSummaryString = 'allCouncilsSummary'; //*table name

String councilDetailString = 'councilDetail'; //*table name

String nameString = 'name';
String descriptionString = 'description';
String gensecIdString = 'gensecId';
String jointGensecId1String = 'jointGensecId1';
String jointGensecId2String = 'jointGensecId2';

String isPORHolderString = 'isPORHolder';
String websiteUrlString = 'websiteUrl';
String facebookUrlString = 'facebookUrl';
String twitterUrlString = 'twitterUrl';
String instagramUrlString = 'instagramUrl';
String linkedinUrlString = 'linkedinUrl';
String youtubeUrlString = 'youtubeUrl';

String porHoldersString = 'porHolders'; //*table name

String emailString = 'email';
String phoneNumberString = 'phoneNumber';
String photoUrlString = 'photoUrl';

String clubSummaryString = 'clubSummary'; //*table name

String clubDetailsString = 'clubDetails'; //*table name

String secyIdString = 'secyId';
String councilNameString = 'councilName';
String councilSmallImageUrlString = 'councilSmallImageUrl';
String councilLargeImageUrlString = 'councilLargeImageUrl';
String jointSecyId1String = 'jointSecyId1';
String jointSecyId2String = 'jointSecyId2';
String isSubscribedString = 'isSubscribed';
String subscribedUsersString = 'subscribedUsers';

// TODO: store tags in database

//! String tagDetailString = 'tagDetail'; //*table name

// String tagNameString = 'tagName';
// String tagIdString = 'tagId';

// ?---------------------------------------------------------------------------------------------------------
// ?---------------------------------------------------------------------------------------------------------
// ?---------------------------------------------------------------------------------------------------------
// ?---------------------------------------------------------------------------------------------------------
// ?---------------------------------------------------------------------------------------------------------

Map<String, dynamic> workshopInfoToMap(BuiltWorkshopSummaryPost workshop) {
  Map<String, dynamic> map = {
    idString: workshop.id,
    clubIdString: workshop.club.id,
    clubString: workshop.club.name == null ? '' : workshop.club.name,
    councilIdString: workshop.club.council.id,
    smallImageUrlString: workshop.club.small_image_url == null
        ? ''
        : workshop.club.small_image_url,
    largeImageUrlString: workshop.club.large_image_url == null
        ? ''
        : workshop.club.large_image_url,
    titleString: workshop.title == null ? '' : workshop.title,
    dateString: workshop.date == null ? '' : workshop.date,
    timeString: workshop.time == null ? '' : workshop.time,
  };
  return map;
}

Map<String, dynamic> councilSummaryInfoToMap(
    BuiltAllCouncilsPost councilSummary) {
  Map<String, dynamic> map = {
    idString: councilSummary.id,
    nameString: councilSummary.name == null ? '' : councilSummary.name,
    smallImageUrlString: councilSummary.small_image_url == null
        ? ''
        : councilSummary.small_image_url,
    largeImageUrlString: councilSummary.large_image_url == null
        ? ''
        : councilSummary.large_image_url,
  };
  return map;
}

Map<String, dynamic> councilDetailToMap(BuiltCouncilPost councilPost) {
  Map<String, dynamic> map = {
    idString: councilPost.id,
    nameString: councilPost.name == null ? '' : councilPost.name,
    descriptionString:
        councilPost.description == null ? '' : councilPost.description,
    gensecIdString: councilPost.gensec == null ? -1 : councilPost.gensec.id,
    jointGensecId1String: (councilPost.joint_gensec.isEmpty)
        ? -1
        : councilPost.joint_gensec[0].id,
    jointGensecId2String: (councilPost.joint_gensec.length < 2)
        ? -1
        : councilPost.joint_gensec[1].id,
    smallImageUrlString:
        councilPost.small_image_url == null ? '' : councilPost.small_image_url,
    largeImageUrlString:
        councilPost.large_image_url == null ? '' : councilPost.large_image_url,
    isPORHolderString: councilPost.is_por_holder == null
        ? 0
        : (councilPost.is_por_holder == true ? 1 : 0),
    websiteUrlString:
        councilPost.website_url == null ? '' : councilPost.website_url,
    facebookUrlString:
        councilPost.facebook_url == null ? '' : councilPost.facebook_url,
    twitterUrlString:
        councilPost.twitter_url == null ? '' : councilPost.twitter_url,
    instagramUrlString:
        councilPost.instagram_url == null ? '' : councilPost.instagram_url,
    linkedinUrlString:
        councilPost.linkedin_url == null ? '' : councilPost.linkedin_url,
    youtubeUrlString:
        councilPost.youtube_url == null ? '' : councilPost.youtube_url,
  };
  return map;
}

Map<String, dynamic> porInfoToMap(
    {SecyPost por, int councilId = -1, int clubId = -1}) {
  Map<String, dynamic> map = {
    idString: por.id,
    councilIdString: councilId,
    clubIdString: clubId,
    nameString: por.name == null ? '' : por.name,
    emailString: por.email == null ? '' : por.email,
    phoneNumberString: por.phone_number == null ? '' : por.phone_number,
    photoUrlString: por.photo_url == null ? '' : por.photo_url,
  };
  return map;
}

Map<String, dynamic> clubSummaryInfoToMap(ClubListPost clubSummary) {
  Map<String, dynamic> map = {
    idString: clubSummary.id,
    nameString: clubSummary.name == null ? '' : clubSummary.name,
    councilIdString:
        (clubSummary.council == null || clubSummary.council.id == null)
            ? 0
            : clubSummary.council.id,
    smallImageUrlString:
        clubSummary.small_image_url == null ? '' : clubSummary.small_image_url,
    largeImageUrlString:
        clubSummary.large_image_url == null ? '' : clubSummary.large_image_url,
  };
  return map;
}

Map<String, dynamic> clubDetailToMap(BuiltClubPost clubPost) {
  Map<String, dynamic> map = {
    idString: clubPost.id,
    nameString: clubPost.name == null ? '' : clubPost.name,
    descriptionString: clubPost.description == null ? '' : clubPost.description,
    councilIdString: clubPost.council.id,
    councilNameString: clubPost.council.name,
    councilSmallImageUrlString: clubPost.council.small_image_url,
    councilLargeImageUrlString: clubPost.council.large_image_url,
    secyIdString: clubPost.secy == null ? -1 : clubPost.secy.id,
    jointSecyId1String:
        (clubPost.joint_secy.isEmpty) ? -1 : clubPost.joint_secy[0].id,
    jointSecyId2String:
        (clubPost.joint_secy.length < 2) ? -1 : clubPost.joint_secy[1].id,
    smallImageUrlString:
        clubPost.small_image_url == null ? '' : clubPost.small_image_url,
    largeImageUrlString:
        clubPost.large_image_url == null ? '' : clubPost.large_image_url,
    isSubscribedString: clubPost.is_subscribed == true ? 1 : 0,
    subscribedUsersString: clubPost.subscribed_users,
    isPORHolderString: clubPost.is_por_holder == null
        ? 0
        : (clubPost.is_por_holder == true ? 1 : 0),
    websiteUrlString: clubPost.website_url == null ? '' : clubPost.website_url,
    facebookUrlString:
        clubPost.facebook_url == null ? '' : clubPost.facebook_url,
    twitterUrlString: clubPost.twitter_url == null ? '' : clubPost.twitter_url,
    instagramUrlString:
        clubPost.instagram_url == null ? '' : clubPost.instagram_url,
    linkedinUrlString:
        clubPost.linkedin_url == null ? '' : clubPost.linkedin_url,
    youtubeUrlString: clubPost.youtube_url == null ? '' : clubPost.youtube_url,
  };
  return map;
}

BuiltWorkshopSummaryPost workshopSummaryFromMap(
    dynamic map, BuiltAllCouncilsPost councilSummary) {
  final workshop = BuiltWorkshopSummaryPost((b) => b
    ..id = map[idString]
    ..club.id = map[clubIdString]
    ..club.name = map[clubString]
    ..club.council =
        councilSummary == null ? null : (councilSummary.toBuilder())
    ..club.small_image_url = map[smallImageUrlString]
    ..club.large_image_url = map[largeImageUrlString]
    ..title = map[titleString]
    ..date = map[dateString]
    ..time = map[timeString]);
  return workshop;
}

BuiltAllCouncilsPost councilSummaryFromMap(dynamic map) {
  final council = BuiltAllCouncilsPost((b) => b
    ..id = map[idString]
    ..name = map[nameString]
    ..small_image_url = map[smallImageUrlString]
    ..large_image_url = map[largeImageUrlString]);
  return council;
}

// var councilDetailFromMap(dynamic map) { }

SecyPost porHolderInfoFromMap(dynamic map) {
  final porHolder = SecyPost((b) => b
    ..id = map[idString]
    ..name = map[nameString]
    ..email = map[emailString]
    ..phone_number = map[phoneNumberString]
    ..photo_url = map[photoUrlString]);
  return porHolder;
}

ClubListPost clubSummaryFromMap(
    dynamic map, BuiltAllCouncilsPost councilSummary) {
  final clubSummary = ClubListPost((b) => b
    ..id = map[idString]
    ..name = map[nameString]
    ..council = councilSummary == null ? null : (councilSummary.toBuilder())
    ..small_image_url = map[smallImageUrlString]
    ..large_image_url = map[largeImageUrlString]);
  return clubSummary;
}

// singleton class to manage the database
class DatabaseHelper {
// This is the actual database filename that is saved in the docs directory.

  static final _databaseName = 'WorkshopInfoDatabase.db';
  // static final _databaseNameTwo = 'WorkshopInfoDatabaseTwo.db';

// Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

// Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// Only allow a single open connection to the database.
  static Database _database;
  // static Database _databaseTwo;

  Future<bool> checkDatabaseIfEmpty() async {
    if (_database == null) {
      return true;
    }
    return false;
  }

  Future<Database> get database async {
    if (_database != null) {
      // print('database has values');
      return _database;
    }
    // print('database is empty');
    _database = await _initDatabase();
    return _database;
  }

// open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = documentDirectory.path + _databaseName;
    // print('path of Database Info: $path');
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onDatabaseCreate,
    );
  }
  // SQL string to create the database

  Future _onDatabaseCreate(Database db, int version) async {
// for workshops summary on homepage

    await db.execute('CREATE TABLE $workshopSummaryString ('
        '$idString INTEGER NOT NULL, '
        '$clubIdString INTEGER NOT NULL, '
        '$clubString DEFAULT "", '
        '$councilIdString INTEGER NOT NULL, '
        '$smallImageUrlString DEFAULT "", '
        '$largeImageUrlString DEFAULT "", '
        '$titleString DEFAULT "", '
        '$dateString DEFAULT "", '
        '$timeString DEFAULT "")');

// for council buttons

    await db.execute('CREATE TABLE $allCouncislSummaryString ('
        '    $idString INTEGER NOT NULL,'
        '        $nameString DEFAULT "",'
        '  $smallImageUrlString DEFAULT "",'
        '$largeImageUrlString DEFAULT "")');

// for council page

    await db.execute('      CREATE TABLE $councilDetailString ('
        '        $idString INTEGER NOT NULL,'
        '        $nameString DEFAULT "",'
        '        $descriptionString DEFAULT "",'
        '        $gensecIdString INTEGER,'
        '        $jointGensecId1String INTEGER,'
        '        $jointGensecId2String INTEGER,'
        '        $smallImageUrlString DEFAULT "",'
        '        $largeImageUrlString DEFAULT "",'
        '        $isPORHolderString INTEGER,'
        '        $websiteUrlString DEFAULT "",'
        '        $facebookUrlString DEFAULT "",'
        '        $twitterUrlString DEFAULT "",'
        '        $instagramUrlString DEFAULT "",'
        '        $linkedinUrlString DEFAULT "",'
        '        $youtubeUrlString DEFAULT "")');

    await db.execute('      CREATE TABLE $porHoldersString ('
        '        $idString INTEGER NOT NULL,'

        // councilId is only to ease the deletion while deleting coucil information
        '        $councilIdString INTEGER NOT NULL,'

        // clubId is only to ease the deletion while deleting club information
        '        $clubIdString INTEGER NOT NULL,'
        //
        '        $nameString DEFAULT "",'
        '        $emailString DEFAULT "",'
        '        $phoneNumberString DEFAULT "",'
        '        $photoUrlString DEFAULT "")');

    await db.execute('      CREATE TABLE $clubSummaryString ('
        '        $idString INTEGER NOT NULL,'
        '        $nameString DEFAULT "",'
        '        $councilIdString INTEGER,'
        '        $smallImageUrlString DEFAULT "",'
        '        $largeImageUrlString DEFAULT "")');

// for club page

    await db.execute('      CREATE TABLE $clubDetailsString ('
        '        $idString INTEGER NOT NULL,'
        '        $nameString DEFAULT "",'
        '        $descriptionString DEFAULT "",'
        '        $councilIdString INTEGER,'
        '        $councilNameString DEFAULT "",'
        '        $councilSmallImageUrlString DEFAULT "",'
        '        $councilLargeImageUrlString DEFAULT "",'
        '        $secyIdString INTEGER,'
        '        $jointSecyId1String INTEGER,'
        '        $jointSecyId2String INTEGER,'
        '        $smallImageUrlString DEFAULT "",'
        '        $largeImageUrlString DEFAULT "",'
        '        $isSubscribedString INTEGER,'
        '        $subscribedUsersString INTEGER,'
        '        $isPORHolderString INTEGER,'
        '        $websiteUrlString DEFAULT "",'
        '        $facebookUrlString DEFAULT "",'
        '        $twitterUrlString DEFAULT "",'
        '        $instagramUrlString DEFAULT "",'
        '        $linkedinUrlString DEFAULT "",'
        '        $youtubeUrlString DEFAULT "")');
  }

  // Database helper methods:

  // Inserting the data-----------------------------------------------------------------------

  Future insertWorkshopSummaryIntoDatabase(
      {@required BuiltWorkshopSummaryPost post}) async {
    Database db = await database;
    await db.insert(workshopSummaryString, workshopInfoToMap(post));
  }

  Future insertCouncilSummaryIntoDatabase(
      {@required BuiltAllCouncilsPost councilSummary}) async {
    Database db = await database;
    await db.insert(
        allCouncislSummaryString, councilSummaryInfoToMap(councilSummary));
  }

  Future insertCouncilDetailsIntoDatabase(
      {@required BuiltCouncilPost councilPost}) async {
    Database db = await database;

    await db.insert(councilDetailString, councilDetailToMap(councilPost));

    await insertPORHoldersIntoDatabase(
        db: db,
        councilId: councilPost.id,
        mainPOR: councilPost.gensec,
        jointPOR: councilPost.joint_gensec);

    await insertClubsSummaryIntoDatabase(db: db, clubs: councilPost.clubs);
  }

  Future insertPORHoldersIntoDatabase(
      {@required Database db,
      int councilId = -1,
      int clubId = -1,
      @required SecyPost mainPOR,
      @required BuiltList<SecyPost> jointPOR}) async {
    if (mainPOR != null) {
      await db.insert(porHoldersString,
          porInfoToMap(por: mainPOR, councilId: councilId, clubId: clubId));
    }

    if (jointPOR.isEmpty != true) {
      await db.insert(porHoldersString,
          porInfoToMap(por: jointPOR[0], councilId: councilId, clubId: clubId));

      if (jointPOR.length > 1) {
        await db.insert(
            porHoldersString,
            porInfoToMap(
                por: jointPOR[1], councilId: councilId, clubId: clubId));
      }
    }
  }

  Future insertClubsSummaryIntoDatabase(
      {@required Database db, @required BuiltList<ClubListPost> clubs}) async {
    for (var club in clubs) {
      await db.insert(clubSummaryString, clubSummaryInfoToMap(club));
    }
  }

  Future insertClubDetailsIntoDatabase(
      {@required BuiltClubPost clubPost}) async {
    Database db = await database;
    await db.insert(clubDetailsString, clubDetailToMap(clubPost));

    await insertPORHoldersIntoDatabase(
        db: db,
        clubId: clubPost.id,
        mainPOR: clubPost.secy,
        jointPOR: clubPost.joint_secy);
  }

  // Fetching the data-----------------------------------------------------------------------

  Future<BuiltList<BuiltWorkshopSummaryPost>> getAllWorkshopsSummary(
      {@required Database db}) async {
    List<Map> maps = await db.query(
      workshopSummaryString,
      columns: [
        idString,
        clubIdString,
        clubString,
        councilIdString,
        smallImageUrlString,
        largeImageUrlString,
        titleString,
        dateString,
        timeString,
      ],
    );

    if (maps.isEmpty) {
      return null;
    }

    BuiltList<BuiltWorkshopSummaryPost> list =
        BuiltList<BuiltWorkshopSummaryPost>([]);
    var builder = list.toBuilder();

    for (var map in maps) {
      // need to fetch council summary data

      BuiltAllCouncilsPost councilSummary =
          await getCouncilsSummaryById(db: db, councilId: map[councilIdString]);

      BuiltWorkshopSummaryPost workshop =
          workshopSummaryFromMap(map, councilSummary);
      builder.add(workshop);
    }
    var workshops = builder.build();
    return workshops;
  }

  Future<BuiltAllCouncilsPost> getCouncilsSummaryById(
      {@required Database db, @required int councilId}) async {
    List<Map> maps = await db.query(
      allCouncislSummaryString,
      columns: [
        idString,
        nameString,
        smallImageUrlString,
        largeImageUrlString,
      ],
      where: '$idString  = $councilId',
    );

    if (maps.isEmpty) {
      return null;
    }

    var map = maps[0];

    BuiltAllCouncilsPost councilSummary = councilSummaryFromMap(map);

    return councilSummary;
  }

  Future<BuiltList<BuiltAllCouncilsPost>> getAllCouncilsSummary(
      {@required Database db}) async {
    List<Map> maps = await db.query(allCouncislSummaryString,
        columns: [
          idString,
          nameString,
          smallImageUrlString,
          largeImageUrlString,
        ],
        orderBy: idString);

    BuiltList<BuiltAllCouncilsPost> list = BuiltList<BuiltAllCouncilsPost>([]);
    var builder = list.toBuilder();

    for (var map in maps) {
      builder.add(councilSummaryFromMap(map));
    }

    var councilsSummary = builder.build();
    return councilsSummary;
  }

// TODO; fetch council only when its required , do not store all councils beforehand.

  Future<BuiltCouncilPost> getCouncilDetail(
      {@required Database db, @required int councilId}) async {
    // it will return only 1 map as every council has unique id

    List<Map> maps = await db.query(
      councilDetailString,
      columns: [
        idString,
        nameString,
        descriptionString,
        gensecIdString,
        jointGensecId1String,
        jointGensecId2String,
        smallImageUrlString,
        largeImageUrlString,
        isPORHolderString,
        websiteUrlString,
        facebookUrlString,
        twitterUrlString,
        instagramUrlString,
        linkedinUrlString,
        youtubeUrlString,
      ],
      where: '$idString  = $councilId',
    );

    if (maps.isEmpty) {
      return null;
    }

    var map = maps[0];

    SecyPost gensec;
    if (map[gensecIdString] != -1) {
      gensec = await getPORHolderInfo(db: db, porId: map[gensecIdString]);
    }

    BuiltList<SecyPost> porList = BuiltList<SecyPost>([]);
    var porBuilder = porList.toBuilder();

    if (map[jointGensecId1String] != -1) {
      var jg1 =
          await getPORHolderInfo(db: db, porId: map[jointGensecId1String]);
      porBuilder.add(jg1);
    }

    if (map[jointGensecId2String] != -1) {
      var jg2 =
          await getPORHolderInfo(db: db, porId: map[jointGensecId2String]);
      porBuilder.add(jg2);
    }

    BuiltList<SecyPost> jointGensec = porBuilder.build();

    BuiltList<ClubListPost> clubs =
        await getClubsSummary(db: db, councilId: councilId);

    final BuiltCouncilPost councilDetails = BuiltCouncilPost((b) => b
      ..id = map[idString]
      ..name = map[nameString]
      ..description = map[descriptionString]
      ..gensec = gensec == null ? null : (gensec.toBuilder())
      ..joint_gensec = jointGensec == null ? null : (jointGensec.toBuilder())
      ..clubs = clubs == null ? null : (clubs.toBuilder())
      ..small_image_url = map[smallImageUrlString]
      ..large_image_url = map[largeImageUrlString]
      ..is_por_holder = map[isPORHolderString] == 1 ? true : false
      ..website_url = map[websiteUrlString]
      ..facebook_url = map[facebookUrlString]
      ..twitter_url = map[twitterUrlString]
      ..instagram_url = map[instagramUrlString]
      ..linkedin_url = map[linkedinUrlString]
      ..youtube_url = map[youtubeUrlString]);

    return councilDetails;
  }

  Future<SecyPost> getPORHolderInfo(
      {@required Database db, @required int porId}) async {
    // it will return only 1 map as every POR Holder has unique id

    List<Map> maps = await db.query(
      porHoldersString,
      columns: [
        idString,
        nameString,
        emailString,
        phoneNumberString,
        photoUrlString,
      ],
      where: '$idString  = $porId',
    );

    var map = maps[0];

    SecyPost porHolder = porHolderInfoFromMap(map);

    return porHolder;
  }

  Future<BuiltList<ClubListPost>> getClubsSummary(
      {@required Database db, @required councilId}) async {
    List<Map> maps = await db.query(
      clubSummaryString,
      columns: [
        idString,
        nameString,
        councilIdString,
        smallImageUrlString,
        largeImageUrlString,
      ],
      where: '$councilIdString  = $councilId',
    );

    BuiltList<ClubListPost> list = BuiltList<ClubListPost>([]);
    var builder = list.toBuilder();

    for (var map in maps) {
// need to fetch council summary data

      BuiltAllCouncilsPost councilSummary =
          await getCouncilsSummaryById(db: db, councilId: map[councilIdString]);

      builder.add(clubSummaryFromMap(map, councilSummary));
    }

    var clubsSummary = builder.build();
    return clubsSummary;
  }

// TODO; fetch club only when its required , do not store all clubs beforehand.

  Future<BuiltClubPost> getClubDetails(
      {@required Database db, @required int clubId}) async {
    // it will return only 1 map as every POR Holder has unique id

    List<Map> maps = await db.query(
      clubDetailsString,
      columns: [
        idString,
        nameString,
        descriptionString,
        councilIdString,
        councilNameString,
        councilSmallImageUrlString,
        councilLargeImageUrlString,
        secyIdString,
        jointSecyId1String,
        jointSecyId2String,
        smallImageUrlString,
        largeImageUrlString,
        isSubscribedString,
        subscribedUsersString,
        isPORHolderString,
        websiteUrlString,
        facebookUrlString,
        twitterUrlString,
        instagramUrlString,
        linkedinUrlString,
        youtubeUrlString,
      ],
      where: '$idString  = $clubId',
    );
    print(
        'club id = $clubId -----------------------------------------------------');
    print(maps.length);

    if (maps.isEmpty) {
      return null;
    }
    var map = maps[0];

    BuiltAllCouncilsPost council = BuiltAllCouncilsPost((b) => b
      ..id = map[councilIdString]
      ..name = map[councilNameString]
      ..small_image_url = map[councilSmallImageUrlString]
      ..large_image_url = map[councilLargeImageUrlString]);

    SecyPost secy;
    if (map[secyIdString] != -1) {
      secy = await getPORHolderInfo(db: db, porId: map[secyIdString]);
    }

    BuiltList<SecyPost> porList = BuiltList<SecyPost>([]);
    var porBuilder = porList.toBuilder();

    if (map[jointSecyId1String] != -1) {
      var js1 = await getPORHolderInfo(db: db, porId: map[jointSecyId1String]);
      porBuilder.add(js1);
    }

    if (map[jointSecyId2String] != -1) {
      var js2 = await getPORHolderInfo(db: db, porId: map[jointSecyId2String]);
      porBuilder.add(js2);
    }
    BuiltList<SecyPost> jointSecy = porBuilder.build();

    final BuiltClubPost clubDetails = BuiltClubPost((b) => b
      ..id = map[idString]
      ..name = map[nameString]
      ..description = map[descriptionString]
      ..council = council == null ? null : (council.toBuilder())
      ..secy = secy == null ? null : (secy.toBuilder())
      ..joint_secy = jointSecy == null ? null : (jointSecy.toBuilder())
      ..small_image_url = map[smallImageUrlString]
      ..large_image_url = map[largeImageUrlString]
      ..is_subscribed = map[isSubscribedString] == 1 ? true : false
      ..subscribed_users = map[subscribedUsersString]
      ..is_por_holder = map[isPORHolderString] == 1 ? true : false
      ..website_url = map[websiteUrlString]
      ..facebook_url = map[facebookUrlString]
      ..twitter_url = map[twitterUrlString]
      ..instagram_url = map[instagramUrlString]
      ..linkedin_url = map[linkedinUrlString]
      ..youtube_url = map[youtubeUrlString]);

    return clubDetails;
  }
// Updating the data-------------------------------------------------------------------------------

  Future updateClubSubcription(
      {@required Database db,
      @required int clubId,
      @required bool isSubscribed,
      @required int subscribedUsers}) async {
    await db.update(
      clubDetailsString,
      {
        isSubscribedString: isSubscribed ? 1 : 0,
        subscribedUsersString: subscribedUsers
      },
      where: '$idString  = $clubId',
    );
  }

  // Deleting the data-----------------------------------------------------------------------

  Future deleteEntryOfCouncilDetail(
      {@required Database db, @required int councilId}) async {
    await db.delete(councilDetailString, where: '$idString = $councilId');

    await db.delete(porHoldersString, where: '$councilIdString = $councilId');

    await db.delete(clubSummaryString, where: '$councilIdString = $councilId');
  }

  Future deleteEntryOfClubDetail(
      {@required Database db, @required int clubId}) async {
    await db.delete(clubDetailsString, where: '$idString = $clubId');

    await db.delete(porHoldersString, where: '$clubIdString = $clubId');
  }

  Future deleteAllWorkshopsSummary({@required Database db}) async {
    await db.delete(workshopSummaryString);
  }

  Future deleteAllCouncilsSummary({@required Database db}) async {
    await db.delete(allCouncislSummaryString);
  }

  Future deleteAllCouncilDetails({@required Database db}) async {
    await db.delete(councilDetailString);
  }

  Future deleteAllPORHolders({@required Database db}) async {
    await db.delete(porHoldersString);
  }

  Future deleteAllClubSummary({@required Database db}) async {
    await db.delete(clubSummaryString);
  }

  Future deleteAllClubDetails({@required Database db}) async {
    await db.delete(clubDetailsString);
  }

  Future deleteWholeDatabase({@required Database db}) async {
    await deleteAllWorkshopsSummary(db: db);
    await deleteAllCouncilsSummary(db: db);
    await deleteAllCouncilDetails(db: db);
    await deleteAllPORHolders(db: db);
    await deleteAllClubSummary(db: db);
    await deleteAllClubDetails(db: db);
  }

  Future closeDatabase({@required Database db}) async => db.close();
}
