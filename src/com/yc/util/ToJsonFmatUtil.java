package com.yc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.entity.AdvertiseDistribution;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;

@Controller
@RequestMapping("/toJsonFmatUtil")
public class ToJsonFmatUtil {
	
	@Autowired
	IAdvertisementDistributionService adverDistributionService;
	
	@Autowired
	IAdvertisementService advertisementService;
	
  	//获得所选页面的广告位
  	@RequestMapping(value = "getAdverPositions", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAdverPositions(String whichPage, HttpServletRequest request) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
    	List<AdvertiseDistribution> adverDistributions = adverDistributionService.getAdvertiseDistributionsByWhichPage(whichPage);
        List<Integer> positions = new ArrayList<Integer>();
        for ( int i = 0; i < adverDistributions.size(); i++ ) {
        	int position = adverDistributions.get(i).getPosition();
        	Integer size = advertisementService.getAdvertiseBywhichPageAndPostion(whichPage, position);
        	if ( adverDistributions.get(i).getNum() == -1 ) {
        		positions.add(position);
        	}
        	
        	else if ( size < adverDistributions.get(i).getNum() ) {
        		positions.add(position);
        	}       	
		}

        mode.put("success", "true");
        mode.put("list", positions);
    	return mode;
    }
  	
  	//获得广告位图片限制
  	@RequestMapping(value = "getImgeWitch", method = RequestMethod.GET)
  	@ResponseBody
  	public Map<String, Object> getImgeWitch(String whichPage,Integer posID, HttpServletRequest request) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
  		AdvertiseDistribution adverDistribution = adverDistributionService.findByWhichPageAndPosition(whichPage, posID);
  		mode.put("success", "true");
  		mode.put("lAndW", adverDistribution.getlAndW());
  		return mode;
  	}
}
