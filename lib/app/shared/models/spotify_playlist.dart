// To parse this JSON data, do
//
//     final playlistModel = playlistModelFromJson(jsonString);

import 'dart:convert';

PlaylistModel playlistModelFromJson(String str) => PlaylistModel.fromJson(json.decode(str));

String playlistModelToJson(PlaylistModel data) => json.encode(data.toJson());

class PlaylistModel {
    PlaylistModel({
        this.collaborative,
        this.description,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.owner,
        this.primaryColor,
        this.public,
        this.snapshotId,
        this.tracks,
        this.type,
        this.uri,
    });

    bool collaborative;
    String description;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    Owner owner;
    dynamic primaryColor;
    bool public;
    String snapshotId;
    Tracks tracks;
    String type;
    String uri;

    factory PlaylistModel.fromJson(Map<String, dynamic> json) => PlaylistModel(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "owner": owner.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks.toJson(),
        "type": type,
        "uri": uri,
    };
}

class ExternalUrls {
    ExternalUrls({
        this.spotify,
    });

    String spotify;

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class Image {
    Image({
        this.height,
        this.url,
        this.width,
    });

    int height;
    String url;
    int width;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

class Owner {
    Owner({
        this.displayName,
        this.externalUrls,
        this.href,
        this.id,
        this.type,
        this.uri,
    });

    String displayName;
    ExternalUrls externalUrls;
    String href;
    String id;
    String type;
    String uri;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
    };
}

class Tracks {
    Tracks({
        this.href,
        this.total,
    });

    String href;
    int total;

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
    };
}
