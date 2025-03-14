-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

--
---@class py.ETypeMeta
--
---@class py.DynamicTypeMeta: py.ETypeMeta
--整型
---@class py.IntBase: py.ETypeMeta
--定点数
---@class py.Fixed: py.ETypeMeta
--定点数Vector2
---@class py.FVector2: py.ETypeMeta
--定点数Vector3
---@class py.FVector3: py.ETypeMeta
--点
---@class py.FPoint: py.FVector3
--UI点
---@class py.FUIPoint: py.FVector2
--Rotation
---@class py.FRotation: py.FVector3
--浮点数Vector2
---@class py.Vector2: py.ETypeMeta
--Vector3
---@class py.Vector3: py.ETypeMeta
--点
---@class py.Point: py.Vector3
--玩家ID
---@class py.RoleID: integer
--玩家关系
---@class py.RoleRelation: integer
--阵营ID
---@class py.CampID: integer
--单位ID
---@class py.UnitID: integer
--本地单位ID
---@class py.LocalUnitID: integer
--装饰物ID
---@class py.DecoID: integer
--主控单位ID
---@class py.HighLightUnitID: integer
--投射物ID
---@class py.ProjectileID: integer
--技能序号
---@class py.AbilitySeq: integer
--单位编号
---@class py.UnitKey: integer
--单位类型
---@class py.UnitType: integer
--技能编号
---@class py.AbilityKey: integer
--天气类型
---@class py.WeatherType: integer
--效果编号
---@class py.ModifierKey: integer
--
---@class py.SortType: integer
--投射物编号
---@class py.ProjectileKey: integer
--技能槽位
---@class py.AbilityIndex: integer
--单次技能释放索引编号
---@class py.AbilityReleaseId: integer
--技能类型
---@class py.AbilityType: integer
--技能释放类型
---@class py.AbilityCastType: integer
--技能字符串类型属性
---@class py.AbilityStrAttr: integer
--可见性规则
---@class py.SfxVisibleType: integer
--起点或终点
---@class py.LinkSfxPointType: integer
--碰撞处理
---@class py.MovementObstacleProcessType: integer
--攻击目标类别
---@class py.AttackTargetHitType: integer
--物品ID
---@class py.ItemID: integer
--物品堆叠类型
---@class py.ItemStackType: integer
--物品编号
---@class py.ItemKey: integer
--字典
---@class py.Dict: py.DynamicTypeMeta
--
---@class py.RandomPool: py.DynamicTypeMeta
--
---@class py.SceneNode: py.DynamicTypeMeta
--科技编号
---@class py.TechKey: integer
--UI动画ID
---@class py.UIAnimKey: py.DynamicTypeMeta
--
---@class py.RoleStatus: integer
--
---@class py.RoleType: integer
--音效编号
---@class py.AudioKey: integer
--特效编号
---@class py.SfxKey: integer
--链接特效编号
---@class py.LinkSfxKey: integer
--模型编号
---@class py.ModelKey: integer
--live2d模型编号
---@class py.Live2dKey: integer
--触发器ID
---@class py.TriggerID: integer
--动态触发器实例
---@class py.DynamicTriggerInstance: py.DynamicTypeMeta
--区域ID
---@class py.AreaID: integer
--场景声音ID
---@class py.SceneSoundID: integer
--镜头timelineID
---@class py.CamlineID: integer
--背包槽位类型
---@class py.SlotType: integer
--
---@class py.RoleResKey: string
--平台商品编号
---@class py.GoodsKey: integer
--平台道具编号
---@class py.StoreKey: integer
--平台道具类型
---@class py.StoreItemType: integer
--
---@class py.TabName: string
--商店页签ID
---@class py.TabIdx: integer
--图片
---@class py.Texture: integer
--序列帧
---@class py.Sequence: integer
--Spine
---@class py.Spine: integer
--小地图颜色显示模式
---@class py.MiniMapColorType: integer
--单位行为
---@class py.UnitBehavior: string
--求救类型
---@class py.ERescueSeekerType: integer
--救援类型
---@class py.ERescuerType: integer
--形状
---@class py.Shape: py.ETypeMeta
--
---@class py.List: py.DynamicTypeMeta
--
---@class py.ExprList: py.List
--
---@class py.UIntList: py.List
--
---@class py.IntList: py.List
--迭代器
---@class py.Iterator: py.DynamicTypeMeta
--
---@class py.Int32Iterator: py.Iterator
--KVBase
---@class py.KVBase: py.DynamicTypeMeta
--
---@class py.Actor: py.KVBase
--Widget
---@class py.WorldUINode: py.KVBase
--UIPreset
---@class py.UIPreset: integer
--Actor容器
---@class py.ActorContainer: py.DynamicTypeMeta
--单位
---@class py.Unit: py.Actor
--本地单位
---@class py.LocalUnit: py.DynamicTypeMeta
--单位组
---@class py.UnitGroup: py.UIntList
--本地单位组
---@class py.LocalUnitGroup: py.UIntList
--单位编号池
---@class py.UnitKeyPool: py.DynamicTypeMeta
--镜头配置
---@class py.Camera: py.DynamicTypeMeta
--玩家组
---@class py.RoleGroup: py.UIntList
--物品对象
---@class py.Item: py.DynamicTypeMeta
--地形预设
---@class py.ScenePreset: integer
--声音对象
---@class py.SoundEntity: py.DynamicTypeMeta
--物品组
---@class py.ItemGroup: py.UIntList
--可破坏物对象
---@class py.Destructible: py.DynamicTypeMeta
--可破坏物ID
---@class py.DestructibleID: integer
--可破坏物编号
---@class py.DestructibleKey: integer
--装饰物编号
---@class py.DecoKey: integer
--GameAPI对象
---@class py.GameAPI: py.DynamicTypeMeta
--玩家
---@class py.Role: py.DynamicTypeMeta
--阵营对象
---@class py.Camp: py.DynamicTypeMeta
--区域
---@class py.Area: py.DynamicTypeMeta
--矩形区域
---@class py.RecArea: py.Area
--圆形区域
---@class py.CirArea: py.Area
--多边形区域
---@class py.PolyArea: py.Area
--
---@class py.RoadGroup: py.List
--光源ID
---@class py.LightID: integer
--光源
---@class py.Light: py.DynamicTypeMeta
--点光源
---@class py.PointLight: py.Light
--方向光源
---@class py.SpotLight: py.Light
--局部雾
---@class py.Fog: py.DynamicTypeMeta
--场景声音
---@class py.SceneSound: py.DynamicTypeMeta
--雾ID
---@class py.FogID: integer
--主控角色预定义行为ID
---@class py.CcActionID: integer
--主控角色动画状态机状态
---@class py.CcAsmState: integer
--主控角色
---@class py.CcHandID: integer
--动画机状态
---@class py.CcAnimationMachineStatus: string
--角色表情
---@class py.CcEmo: integer
--技能对象
---@class py.Ability: py.Actor
--效果对象
---@class py.ModifierEntity: py.Actor
--效果类型
---@class py.ModifierEffectType: integer
--魔法效果类别
---@class py.ModifierType: integer
--效果类别
---@class py.ModifierStyle: integer
--投掷物对象
---@class py.ProjectileEntity: py.Actor
--投射物组
---@class py.ProjectileGroup: py.UIntList
--
---@class py.ActorList: py.List
--
---@class py.UnitList: py.ActorList
--单位展示模型
---@class py.UnitModel: py.DynamicTypeMeta
--格子阵列
---@class py.Grid: py.DynamicTypeMeta
--绑定单位界面
---@class py.BinUnitPanel: string
--挂接模型实体
---@class py.AttachModelEntity: py.Actor
--挂接模型实体组
---@class py.AttachModelEntityGroup: py.ActorList
--
---@class py.ModelEntity: integer
--
---@class py.RoleRes: string
--镜头预设
---@class py.CameraPreset: py.DynamicTypeMeta
--路径
---@class py.Road: py.List
--
---@class py.Model: integer
--
---@class py.Live2d: integer
--特效
---@class py.Sfx: py.DynamicTypeMeta
--链接特效
---@class py.LinkSfx: py.DynamicTypeMeta
--单位命令
---@class py.UnitCommand: py.DynamicTypeMeta
--
---@class py.UnitCommandType: integer
--单位组命令
---@class py.UnitGroupCommand: py.DynamicTypeMeta
--
---@class py.UnitGroupCommandType: integer
--颜色
---@class py.Color: string
--计时器
---@class py.Timer: integer
--公式
---@class py.Formula: integer
--键盘按键
---@class py.KeyboardKey: integer
--键盘辅助按键
---@class py.FuncKeyboardKey: integer
--鼠标按键
---@class py.MouseKey: integer
--鼠标滚轮
---@class py.MouseWheel: integer
--鼠标按键（仅包含左右键）
---@class py.MouseKeyWithoutMiddle: integer
--
---@class py.GameMode: integer
--
---@class py.MapId: string
--
---@class py.StartMode: integer
--
---@class py.UppassEnv: string
--
---@class py.EditableGameFunc: integer
--
---@class py.AllGameFunc: integer
--
---@class py.NormalKey: string
--
---@class py.RecordKey: string
--
---@class py.CameraRotate: integer
--
---@class py.LanguageType: string
--
---@class py.HitPointKey: integer
--曲线运动器路径
---@class py.CurvedPath: py.List
--3D曲线运动器路径
---@class py.CurvedPath3D: py.List
--表
---@class py.Table: py.DynamicTypeMeta
--画风
---@class py.PostEffect: integer
--
---@class py.UIPrefabIns: py.DynamicTypeMeta
--技能指示器类型
---@class py.SkillPointerType: integer
--运动器类型
---@class py.MoverType: integer
--运动器类型
---@class py.Mover: py.DynamicTypeMeta
--信号类型
---@class py.SignalType: integer
--信号可见类型
---@class py.SignalVisibleType: integer
--鼠标编号
---@class py.CursorKey: integer
--鼠标状态
---@class py.CursorState: string
--平台装饰类型
---@class py.PlatformDecoType: integer
--签到天数类型
---@class py.PlatformSigninType: integer
--玩家社区互动类型
---@class py.PlatformCommunityType: integer
--物理组件
---@class py.PhysicsObject: py.Actor
--逻辑物理组件
---@class py.PhysicsEntity: py.Actor
--物理过滤器
---@class py.PhysicsFilter: py.Actor
--物理组件类型
---@class py.PhysicsObjectKey: integer
--逻辑物理组件类型
---@class py.PhysicsEntityKey: integer
--刚体
---@class py.RigidBody: py.Actor
--刚体组
---@class py.RigidBodyGroup: py.UIntList
--碰撞体
---@class py.Collider: py.Actor
--关节
---@class py.Joint: py.Actor
--物理Reaction
---@class py.Reaction: py.Actor
--物理Reaction Group
---@class py.ReactionGroup: py.DynamicTypeMeta
--表排序顺序
---@class py.TableOrder: integer
--镜头模式
---@class py.CameraMode: integer
--相机射线方向
---@class py.CameraRayDirection: integer
--逻辑物理组件状态
---@class py.PhysicsEntityState: integer
--关卡
---@class py.Map: integer
--移动方向
---@class py.MoveDirection: integer
--画质
---@class py.ImageQuality: integer
--观战模式状态
---@class py.WatchingModeStatus: integer
--牵引力
---@class py.Force: integer
--steam位置状态
---@class py.SITE_STATE: integer
--steam币种
---@class py.COIN_CURRENCY: string
