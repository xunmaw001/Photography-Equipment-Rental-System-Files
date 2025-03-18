package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.ZulinfankuiEntity;
import com.entity.view.ZulinfankuiView;

import com.service.ZulinfankuiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 租赁反馈
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@RestController
@RequestMapping("/zulinfankui")
public class ZulinfankuiController {
    @Autowired
    private ZulinfankuiService zulinfankuiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ZulinfankuiEntity zulinfankui, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			zulinfankui.setShangjiazhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<ZulinfankuiEntity> ew = new EntityWrapper<ZulinfankuiEntity>();
    	PageUtils page = zulinfankuiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, zulinfankui), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,ZulinfankuiEntity zulinfankui, HttpServletRequest request){
        EntityWrapper<ZulinfankuiEntity> ew = new EntityWrapper<ZulinfankuiEntity>();
    	PageUtils page = zulinfankuiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, zulinfankui), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ZulinfankuiEntity zulinfankui){
       	EntityWrapper<ZulinfankuiEntity> ew = new EntityWrapper<ZulinfankuiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( zulinfankui, "zulinfankui")); 
        return R.ok().put("data", zulinfankuiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ZulinfankuiEntity zulinfankui){
        EntityWrapper< ZulinfankuiEntity> ew = new EntityWrapper< ZulinfankuiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( zulinfankui, "zulinfankui")); 
		ZulinfankuiView zulinfankuiView =  zulinfankuiService.selectView(ew);
		return R.ok("查询租赁反馈成功").put("data", zulinfankuiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        ZulinfankuiEntity zulinfankui = zulinfankuiService.selectById(id);
        return R.ok().put("data", zulinfankui);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        ZulinfankuiEntity zulinfankui = zulinfankuiService.selectById(id);
        return R.ok().put("data", zulinfankui);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ZulinfankuiEntity zulinfankui, HttpServletRequest request){
    	zulinfankui.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(zulinfankui);

        zulinfankuiService.insert(zulinfankui);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ZulinfankuiEntity zulinfankui, HttpServletRequest request){
    	zulinfankui.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(zulinfankui);

        zulinfankuiService.insert(zulinfankui);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ZulinfankuiEntity zulinfankui, HttpServletRequest request){
        //ValidatorUtils.validateEntity(zulinfankui);
        zulinfankuiService.updateById(zulinfankui);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        zulinfankuiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<ZulinfankuiEntity> wrapper = new EntityWrapper<ZulinfankuiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			wrapper.eq("shangjiazhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = zulinfankuiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
