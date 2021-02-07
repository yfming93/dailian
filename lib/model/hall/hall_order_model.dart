class HallOrderModelGameServer {
/*
{
  "id": 523,
  "game_region_id": 3,
  "name": "默认服",
  "sort": 1,
  "created_at": "2019-08-26 18:29:14",
  "updated_at": "2019-08-26 18:29:14"
} 
*/

  String id;
  String gameRegionId;
  String name;
  String sort;
  String createdAt;
  String updatedAt;

  HallOrderModelGameServer({
    this.id,
    this.gameRegionId,
    this.name,
    this.sort,
    this.createdAt,
    this.updatedAt,
  });
  HallOrderModelGameServer.fromJson(Map<String, dynamic> json) {
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

class HallOrderModelGameRegion {
/*
{
  "id": 3,
  "game_id": 1,
  "name": "苹果微信",
  "sort": 3,
  "created_at": "2019-08-22 16:17:35",
  "updated_at": "2019-08-22 16:17:35"
} 
*/

  String id;
  String gameId;
  String name;
  String sort;
  String createdAt;
  String updatedAt;

  HallOrderModelGameRegion({
    this.id,
    this.gameId,
    this.name,
    this.sort,
    this.createdAt,
    this.updatedAt,
  });
  HallOrderModelGameRegion.fromJson(Map<String, dynamic> json) {
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

class HallOrderModelGame {
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

  HallOrderModelGame({
    this.id,
    this.name,
    this.sort,
    this.status,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.hot,
  });
  HallOrderModelGame.fromJson(Map<String, dynamic> json) {
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

class HallOrderModelSecondsLeft {
/*
{
  "second": 90000,
  "dynamic": false
} 
*/

  String second;
  bool theDynamic;

  HallOrderModelSecondsLeft({
    this.second,
    this.theDynamic,
  });
  HallOrderModelSecondsLeft.fromJson(Map<String, dynamic> json) {
    second = json["second"]?.toString();
    theDynamic = json["dynamic"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["second"] = second;
    data["dynamic"] = theDynamic;
    return data;
  }
}

class HallOrderModel {
/*
{
  "trade_no": "WZ20210207010706004246",
  "username": "万马奔腾",
  "game_leveling_type_id": 1,
  "apply_complete_at": null,
  "take_at": null,
  "security_deposit": 30,
  "efficiency_deposit": 30,
  "take_password": 0,
  "game_id": 1,
  "game_region_id": 3,
  "game_server_id": 523,
  "title": "【排位】扫码登录！王者10星-王者20星指定 小明备选瑶 关定位*英雄指定英雄明世隐，备用英雄瑶*铭文150",
  "amount": 49,
  "hour": "25.00",
  "explain": "指定单被拌，被禁，上传截图，完成之后上传战绩截图！加快结算速度！",
  "requirement": "-- 禁止泄露网站信息.禁止辱骂号主.(如泄露网站信息或辱骂号主我方有权扣除双金)合作共赢.麻烦代练大哥配合.\r\n-- 微信区: 号主联系方式,在当前角色名字的后面,自己问一下,态度好一点。 \r\n-- QQ区:  先进游戏 然后后台登录账号,不可以登录玩家QQ~ 有问题进群715-105-548联系qq群管理,别轻易提交撤单,\r\n-- 密码错误扫码冻结等问题请自己电话联系顾客解决下可以节省您的时间。 接单后退单要扣效率保证金~\r\n-- 动用金币点劵钻石体验卡等必须先经过我同意之后才能使用,否则扣双金\r\n-- 订单出现一页四红三连败及以上我方有权申请撤单要求赔付效率金。 \r\n-- 接单半小时内必须上号开打并发送首图到网站,完成必须上传完成图~(排行榜带名字截图,指定英雄.如被禁被抢必须上传相关截图,及时上传首图进度图。防止号主联系不上或者恶意不提供截图,造成不必要的损失麻烦。)",
  "created_at": "2021-02-07 01:07:06",
  "status": 2,
  "total_deposit": "60.00",
  "collect": false,
  "ad_img": "https://wz-upload.oss-cn-hangzhou.aliyuncs.com/m0u6qphpRqhHgv1611045457210119.gif",
  "seconds_left": {
    "second": 90000,
    "dynamic": false
  },
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
    "id": 3,
    "game_id": 1,
    "name": "苹果微信",
    "sort": 3,
    "created_at": "2019-08-22 16:17:35",
    "updated_at": "2019-08-22 16:17:35"
  },
  "game_server": {
    "id": 523,
    "game_region_id": 3,
    "name": "默认服",
    "sort": 1,
    "created_at": "2019-08-26 18:29:14",
    "updated_at": "2019-08-26 18:29:14"
  }
} 
*/

  String tradeNo;
  String username;
  String gameLevelingTypeId;
  String applyCompleteAt;
  String takeAt;
  String securityDeposit;
  String efficiencyDeposit;
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
  bool collect;
  String adImg;
  HallOrderModelSecondsLeft secondsLeft;
  HallOrderModelGame game;
  HallOrderModelGameRegion gameRegion;
  HallOrderModelGameServer gameServer;

  HallOrderModel({
    this.tradeNo,
    this.username,
    this.gameLevelingTypeId,
    this.applyCompleteAt,
    this.takeAt,
    this.securityDeposit,
    this.efficiencyDeposit,
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
    this.collect,
    this.adImg,
    this.secondsLeft,
    this.game,
    this.gameRegion,
    this.gameServer,
  });
  HallOrderModel.fromJson(Map<String, dynamic> json) {
    tradeNo = json["trade_no"]?.toString();
    username = json["username"]?.toString();
    gameLevelingTypeId = json["game_leveling_type_id"]?.toString();
    applyCompleteAt = json["apply_complete_at"]?.toString();
    takeAt = json["take_at"]?.toString();
    securityDeposit = json["security_deposit"]?.toString();
    efficiencyDeposit = json["efficiency_deposit"]?.toString();
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
    collect = json["collect"];
    adImg = json["ad_img"]?.toString();
    secondsLeft = json["seconds_left"] != null ? HallOrderModelSecondsLeft.fromJson(json["seconds_left"]) : null;
    game = json["game"] != null ? HallOrderModelGame.fromJson(json["game"]) : null;
    gameRegion = json["game_region"] != null ? HallOrderModelGameRegion.fromJson(json["game_region"]) : null;
    gameServer = json["game_server"] != null ? HallOrderModelGameServer.fromJson(json["game_server"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["trade_no"] = tradeNo;
    data["username"] = username;
    data["game_leveling_type_id"] = gameLevelingTypeId;
    data["apply_complete_at"] = applyCompleteAt;
    data["take_at"] = takeAt;
    data["security_deposit"] = securityDeposit;
    data["efficiency_deposit"] = efficiencyDeposit;
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
    data["collect"] = collect;
    data["ad_img"] = adImg;
    if (secondsLeft != null) {
      data["seconds_left"] = secondsLeft.toJson();
    }
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