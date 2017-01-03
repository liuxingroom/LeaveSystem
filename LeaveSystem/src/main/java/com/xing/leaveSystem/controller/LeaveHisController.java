package com.xing.leaveSystem.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.xing.leaveSystem.service.LeaveHisService;

@Controller
public class LeaveHisController {
	
	@Resource
	LeaveHisService leaveHisService;
	
}
