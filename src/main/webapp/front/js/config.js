
/**
 * 轮播图配置
 */
var swiper = {
	// 设定轮播容器宽度，支持像素和百分比
	width: '100%',
	height: '400px',
	// hover（悬停显示）
	// always（始终显示）
	// none（始终不显示）
	arrow: 'none',
	// default（左右切换）
	// updown（上下切换）
	// fade（渐隐渐显切换）
	anim: 'default',
	// 自动切换的时间间隔
	// 默认3000
	interval: 2000,
	// 指示器位置
	// inside（容器内部）
	// outside（容器外部）
	// none（不显示）
	indicator: 'outside'
}

/**
 * 个人中心菜单
 */
var centerMenu = [{
	name: '个人中心',
	url: '../' + localStorage.getItem('userTable') + '/center.jsp'
}, 
{
	name: '我的发布',
	url: '../forum/list-my.jsp'
},

{
	name: '我的收藏',
	url: '../storeup/list.jsp'
}
]


var indexNav = [

{
	name: '器材信息',
	url: './pages/qicaixinxi/list.jsp'
}, 

{
	name: '论坛信息',
	url: './pages/forum/list.jsp'
}, 
{
	name: '新闻资讯',
	url: './pages/news/list.jsp'
},
]

var adminurl =  "http://localhost:8080/jsptNHaA/index.jsp";

var cartFlag = false

var chatFlag = false




var menu = [{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"用户列表","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"商家列表","menuJump":"列表","tableName":"shangjia"}],"menu":"商家管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"器材分类列表","menuJump":"列表","tableName":"qicaifenlei"}],"menu":"器材分类管理"},{"child":[{"buttons":["新增","查看","修改","删除","租赁"],"menu":"器材信息列表","menuJump":"列表","tableName":"qicaixinxi"}],"menu":"器材信息管理"},{"child":[{"buttons":["新增","查看","修改","删除","审核","支付","提醒"],"menu":"器材租赁列表","menuJump":"列表","tableName":"qicaizulin"}],"menu":"器材租赁管理"},{"child":[{"buttons":["新增","查看","修改","删除","回复"],"menu":"聊天信息列表","menuJump":"列表","tableName":"liaotianxinxi"}],"menu":"聊天信息管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"聊天回复列表","menuJump":"列表","tableName":"liaotianhuifu"}],"menu":"聊天回复管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"归还提醒列表","menuJump":"列表","tableName":"guihaitixing"}],"menu":"归还提醒管理"},{"child":[{"buttons":["新增","查看","修改","删除","审核"],"menu":"租赁反馈列表","menuJump":"列表","tableName":"zulinfankui"}],"menu":"租赁反馈管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"论坛管理","tableName":"luntanguanli"}],"menu":"论坛管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"lunbotuguanli"},{"buttons":["新增","查看","修改","删除"],"menu":"新闻资讯列表","tableName":"news"}],"menu":"系统管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"收藏列表","tableName":"storeup"}],"menu":"我的收藏管理"},{"child":[{"buttons":["新增","查看","修改","删除","审核","扣押金"],"menu":"押金缴纳列表","menuJump":"列表","tableName":"yajinjiaona"}],"menu":"押金缴纳管理"},{"child":[{"buttons":["查看","修改","删除"],"menu":"扣除押金列表","menuJump":"列表","tableName":"kouchuyajin"}],"menu":"扣除押金管理"}],"frontMenu":[{"child":[{"buttons":["查看","租赁"],"menu":"器材信息列表","menuJump":"列表","tableName":"qicaixinxi"}],"menu":"器材信息模块"}],"roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"buttons":["查看","删除"],"menu":"器材租赁列表","menuJump":"列表","tableName":"qicaizulin"}],"menu":"器材租赁管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"聊天信息列表","menuJump":"列表","tableName":"liaotianxinxi"}],"menu":"聊天信息管理"},{"child":[{"buttons":["查看"],"menu":"聊天回复列表","menuJump":"列表","tableName":"liaotianhuifu"}],"menu":"聊天回复管理"},{"child":[{"buttons":["查看"],"menu":"归还提醒列表","menuJump":"列表","tableName":"guihaitixing"}],"menu":"归还提醒管理"},{"child":[{"buttons":["查看","支付"],"menu":"押金缴纳列表","menuJump":"列表","tableName":"yajinjiaona"}],"menu":"押金缴纳管理"},{"child":[{"buttons":["查看"],"menu":"扣除押金列表","menuJump":"列表","tableName":"kouchuyajin"}],"menu":"扣除押金管理"},{"child":[{"buttons":["查看","删除"],"menu":"论坛管理","tableName":"luntanguanli"}],"menu":"论坛管理"},{"child":[{"buttons":["查看","删除"],"menu":"收藏列表","tableName":"storeup"}],"menu":"我的收藏管理"}],"frontMenu":[{"child":[{"buttons":["查看","租赁"],"menu":"器材信息列表","menuJump":"列表","tableName":"qicaixinxi"}],"menu":"器材信息模块"}],"roleName":"用户","tableName":"yonghu"},{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"器材分类列表","menuJump":"列表","tableName":"qicaifenlei"}],"menu":"器材分类管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"器材信息列表","menuJump":"列表","tableName":"qicaixinxi"}],"menu":"器材信息管理"},{"child":[{"buttons":["查看","修改","删除","审核","提醒"],"menu":"器材租赁列表","menuJump":"列表","tableName":"qicaizulin"}],"menu":"器材租赁管理"},{"child":[{"buttons":["查看","修改","删除","回复"],"menu":"聊天信息列表","menuJump":"列表","tableName":"liaotianxinxi"}],"menu":"聊天信息管理"},{"child":[{"buttons":["查看","修改","删除"],"menu":"聊天回复列表","menuJump":"列表","tableName":"liaotianhuifu"}],"menu":"聊天回复管理"},{"child":[{"buttons":["查看","修改","删除"],"menu":"归还提醒列表","menuJump":"列表","tableName":"guihaitixing"}],"menu":"归还提醒管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"租赁反馈列表","menuJump":"列表","tableName":"zulinfankui"}],"menu":"租赁反馈管理"}],"frontMenu":[{"child":[{"buttons":["查看","租赁"],"menu":"器材信息列表","menuJump":"列表","tableName":"qicaixinxi"}],"menu":"器材信息模块"}],"roleName":"商家","tableName":"shangjia"}]


var isAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].backMenu.length;j++){
                for(let k=0;k<menus[i].backMenu[j].child.length;k++){
                    if(tableName==menus[i].backMenu[j].child[k].tableName){
                        let buttons = menus[i].backMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

var isFrontAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].frontMenu.length;j++){
                for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
                    if(tableName==menus[i].frontMenu[j].child[k].tableName){
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}
