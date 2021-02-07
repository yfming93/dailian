class HallModelGameServer {
/*
{
  "id": 639,
  "game_region_id": 4,
  "name": "默认服",
  "sort": 1,
  "created_at": "2019-08-26 18:29:31",
  "updated_at": "2019-08-26 18:29:31"
}
*/

  String id;
  String gameRegionId;
  String name;
  String sort;
  String createdAt;
  String updatedAt;

  HallModelGameServer({
    this.id,
    this.gameRegionId,
    this.name,
    this.sort,
    this.createdAt,
    this.updatedAt,
  });
  HallModelGameServer.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    gameRegionId = json["game_region_id"]?.toString();
    name = json["name"]?.toString();
    sort = json["sort"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["game_region_id"] = gameRegionId;
    data["name"] = name;
    data["sort"] = sort;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class HallModelGameRegion {
/*
{
  "id": 4,
  "game_id": 1,
  "name": "安卓微信",
  "sort": 4,
  "created_at": "2019-08-22 16:17:42",
  "updated_at": "2019-08-22 16:17:42"
}
*/

  String id;
  String gameId;
  String name;
  String sort;
  String createdAt;
  String updatedAt;

  HallModelGameRegion({
    this.id,
    this.gameId,
    this.name,
    this.sort,
    this.createdAt,
    this.updatedAt,
  });
  HallModelGameRegion.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    gameId = json["game_id"]?.toString();
    name = json["name"]?.toString();
    sort = json["sort"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["game_id"] = gameId;
    data["name"] = name;
    data["sort"] = sort;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class HallModelGame {
/*
{
  "id": 1,
  "name": "王者荣耀",
  "sort": 1,
  "status": 1,
  "icon": "https://temp-image-upload.oss-cn-shenzhen.aliyuncs.com/zaY70phpRp85wB1575367178191203.png",
  "created_at": "2019-08-22 16:16:28",
  "updated_at": "2020-09-08 20:38:56",
  "hot": 1
}
*/

  String id;
  String name;
  String sort;
  String status;
  String icon;
  String createdAt;
  String updatedAt;
  String hot;

  HallModelGame({
    this.id,
    this.name,
    this.sort,
    this.status,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.hot,
  });
  HallModelGame.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    name = json["name"]?.toString();
    sort = json["sort"]?.toString();
    status = json["status"]?.toString();
    icon = json["icon"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
    hot = json["hot"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["sort"] = sort;
    data["status"] = status;
    data["icon"] = icon;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["hot"] = hot;
    return data;
  }
}

class HallModel {
/*
{
  "0": "security_deposit",
  "1": "efficiency_deposit",
  "category": 1,
  "group_id": 0,
  "trade_no": "WZ20210206202049005431",
  "username": "享受寂寞心",
  "take_password": 0,
  "game_id": 1,
  "game_region_id": 4,
  "game_server_id": 639,
  "title": "【排位】陪练 星耀3五 星-王者 态度差 0结算 接单马上联系客户",
  "amount": 56,
  "hour": "33.00",
  "explain": null,
  "requirement": null,
  "created_at": "2021-02-06 20:20:49",
  "status": 2,
  "total_deposit": "30.00",
  "game": {
    "id": 1,
    "name": "王者荣耀",
    "sort": 1,
    "status": 1,
    "icon": "https://temp-image-upload.oss-cn-shenzhen.aliyuncs.com/zaY70phpRp85wB1575367178191203.png",
    "created_at": "2019-08-22 16:16:28",
    "updated_at": "2020-09-08 20:38:56",
    "hot": 1
  },
  "game_region": {
    "id": 4,
    "game_id": 1,
    "name": "安卓微信",
    "sort": 4,
    "created_at": "2019-08-22 16:17:42",
    "updated_at": "2019-08-22 16:17:42"
  },
  "game_server": {
    "id": 639,
    "game_region_id": 4,
    "name": "默认服",
    "sort": 1,
    "created_at": "2019-08-26 18:29:31",
    "updated_at": "2019-08-26 18:29:31"
  }
}
*/

  String category;
  String groupId;
  String tradeNo;
  String username;
  String takePassword;
  String gameId;
  String gameRegionId;
  String gameServerId;
  String title;
  String amount;
  String hour;
  String explain;
  String requirement;
  String createdAt;
  String status;
  String totalDeposit;
  HallModelGame game;
  HallModelGameRegion gameRegion;
  HallModelGameServer gameServer;

  HallModel({
  this.category,
  this.groupId,
  this.tradeNo,
  this.username,
  this.takePassword,
  this.gameId,
  this.gameRegionId,
  this.gameServerId,
  this.title,
  this.amount,
  this.hour,
  this.explain,
  this.requirement,
  this.createdAt,
  this.status,
  this.totalDeposit,
  this.game,
  this.gameRegion,
  this.gameServer,
  });
  HallModel.fromJson(Map<String, dynamic> json) {
    category = json["category"]?.toString();
    groupId = json["group_id"]?.toString();
    tradeNo = json["trade_no"]?.toString();
    username = json["username"]?.toString();
    takePassword = json["take_password"]?.toString();
    gameId = json["game_id"]?.toString();
    gameRegionId = json["game_region_id"]?.toString();
    gameServerId = json["game_server_id"]?.toString();
    title = json["title"]?.toString();
    amount = json["amount"]?.toString();
    hour = json["hour"]?.toString();
    explain = json["explain"]?.toString();
    requirement = json["requirement"]?.toString();
    createdAt = json["created_at"]?.toString();
    status = json["status"]?.toString();
    totalDeposit = json["total_deposit"]?.toString();
    game = json["game"] != null ? HallModelGame.fromJson(json["game"]) : null;
    gameRegion = json["game_region"] != null ? HallModelGameRegion.fromJson(json["game_region"]) : null;
    gameServer = json["game_server"] != null ? HallModelGameServer.fromJson(json["game_server"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["0"] = 0;
    data["1"] = 1;
    data["category"] = category;
    data["group_id"] = groupId;
    data["trade_no"] = tradeNo;
    data["username"] = username;
    data["take_password"] = takePassword;
    data["game_id"] = gameId;
    data["game_region_id"] = gameRegionId;
    data["game_server_id"] = gameServerId;
    data["title"] = title;
    data["amount"] = amount;
    data["hour"] = hour;
    data["explain"] = explain;
    data["requirement"] = requirement;
    data["created_at"] = createdAt;
    data["status"] = status;
    data["total_deposit"] = totalDeposit;
    if (game != null) {
      data["game"] = game.toJson();
    }
    if (gameRegion != null) {
      data["game_region"] = gameRegion.toJson();
    }
    if (gameServer != null) {
      data["game_server"] = gameServer.toJson();
    }
    return data;
  }
}