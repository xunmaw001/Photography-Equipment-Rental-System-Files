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

import com.entity.YajinjiaonaEntity;
import com.entity.view.YajinjiaonaView;

import com.service.YajinjiaonaService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 押金缴纳
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@RestController
@RequestMapping("/yajinjiaona")
public class YajinjiaonaController {
    @Autowired
    private YajinjiaonaService yajinjiaonaService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,YajinjiaonaEntity yajinjiaona, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			yajinjiaona.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<YajinjiaonaEntity> ew = new EntityWrapper<YajinjiaonaEntity>();
    	PageUtils page = yajinjiaonaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yajinjiaona), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,YajinjiaonaEntity yajinjiaona, HttpServletRequest request){
        EntityWrapper<YajinjiaonaEntity> ew = new EntityWrapper<YajinjiaonaEntity>();
    	PageUtils page = yajinjiaonaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yajinjiaona), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( YajinjiaonaEntity yajinjiaona){
       	EntityWrapper<YajinjiaonaEntity> ew = new EntityWrapper<YajinjiaonaEntity>();
      	ew.allEq(MPUtil.allEQMapPre( yajinjiaona, "yajinjiaona")); 
        return R.ok().put("data", yajinjiaonaService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(YajinjiaonaEntity yajinjiaona){
        EntityWrapper< YajinjiaonaEntity> ew = new EntityWrapper< YajinjiaonaEntity>();
 		ew.allEq(MPUtil.allEQMapPre( yajinjiaona, "yajinjiaona")); 
		YajinjiaonaView yajinjiaonaView =  yajinjiaonaService.selectView(ew);
		return R.ok("查询押金缴纳成功").put("data", yajinjiaonaView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        YajinjiaonaEntity yajinjiaona = yajinjiaonaService.selectById(id);
        return R.ok().put("data", yajinjiaona);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        YajinjiaonaEntity yajinjiaona = yajinjiaonaService.selectById(id);
        return R.ok().put("data", yajinjiaona);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody YajinjiaonaEntity yajinjiaona, HttpServletRequest request){
    	yajinjiaona.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(yajinjiaona);

        yajinjiaonaService.insert(yajinjiaona);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody YajinjiaonaEntity yajinjiaona, HttpServletRequest request){
    	yajinjiaona.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(yajinjiaona);

        yajinjiaonaService.insert(yajinjiaona);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody YajinjiaonaEntity yajinjiaona, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yajinjiaona);
        yajinjiaonaService.updateById(yajinjiaona);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        yajinjiaonaService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<YajinjiaonaEntity> wrapper = new EntityWrapper<YajinjiaonaEntity>();
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

		int count = yajinjiaonaService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
