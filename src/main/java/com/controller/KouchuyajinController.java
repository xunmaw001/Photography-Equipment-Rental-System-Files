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

import com.entity.KouchuyajinEntity;
import com.entity.view.KouchuyajinView;

import com.service.KouchuyajinService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 扣除押金
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@RestController
@RequestMapping("/kouchuyajin")
public class KouchuyajinController {
    @Autowired
    private KouchuyajinService kouchuyajinService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,KouchuyajinEntity kouchuyajin, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			kouchuyajin.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<KouchuyajinEntity> ew = new EntityWrapper<KouchuyajinEntity>();
    	PageUtils page = kouchuyajinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kouchuyajin), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,KouchuyajinEntity kouchuyajin, HttpServletRequest request){
        EntityWrapper<KouchuyajinEntity> ew = new EntityWrapper<KouchuyajinEntity>();
    	PageUtils page = kouchuyajinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kouchuyajin), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( KouchuyajinEntity kouchuyajin){
       	EntityWrapper<KouchuyajinEntity> ew = new EntityWrapper<KouchuyajinEntity>();
      	ew.allEq(MPUtil.allEQMapPre( kouchuyajin, "kouchuyajin")); 
        return R.ok().put("data", kouchuyajinService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(KouchuyajinEntity kouchuyajin){
        EntityWrapper< KouchuyajinEntity> ew = new EntityWrapper< KouchuyajinEntity>();
 		ew.allEq(MPUtil.allEQMapPre( kouchuyajin, "kouchuyajin")); 
		KouchuyajinView kouchuyajinView =  kouchuyajinService.selectView(ew);
		return R.ok("查询扣除押金成功").put("data", kouchuyajinView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        KouchuyajinEntity kouchuyajin = kouchuyajinService.selectById(id);
        return R.ok().put("data", kouchuyajin);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        KouchuyajinEntity kouchuyajin = kouchuyajinService.selectById(id);
        return R.ok().put("data", kouchuyajin);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody KouchuyajinEntity kouchuyajin, HttpServletRequest request){
    	kouchuyajin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(kouchuyajin);

        kouchuyajinService.insert(kouchuyajin);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody KouchuyajinEntity kouchuyajin, HttpServletRequest request){
    	kouchuyajin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(kouchuyajin);

        kouchuyajinService.insert(kouchuyajin);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody KouchuyajinEntity kouchuyajin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(kouchuyajin);
        kouchuyajinService.updateById(kouchuyajin);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        kouchuyajinService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<KouchuyajinEntity> wrapper = new EntityWrapper<KouchuyajinEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			wrapper.eq("yonghuming", (String)request.getSession().getAttribute("username"));
		}

		int count = kouchuyajinService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
