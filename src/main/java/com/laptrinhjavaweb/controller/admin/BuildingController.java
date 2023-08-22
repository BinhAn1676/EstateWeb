package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.dto.response.BuildingResponseDTO;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.UserService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import com.laptrinhjavaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

	@Autowired
	private IBuildingService buildingService;

	@Autowired
	private IUserService userService;

	@Autowired
	private MessageUtils messageUtil;

	@RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
	public ModelAndView buildingList(@ModelAttribute("modelSearch") BuildingRequest buildingRequest,
									 HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/building/list");
		//phan trang
		DisplayTagUtils.of(request, buildingRequest);
		List<BuildingResponseDTO> buildingResponseDTOS = buildingService.findBuilding(buildingRequest,new PageRequest(
				buildingRequest.getPage() - 1, buildingRequest.getMaxPageItems()));

		buildingRequest.setListResult(buildingResponseDTOS);
		buildingRequest.setTotalItems(buildingService.countTotalItems(buildingRequest));
		mav.addObject("modelSearch", buildingRequest);//in cac toa nha ra view
		mav.addObject(SystemConstant.STAFFS,userService.getStaffMap());
		mav.addObject(SystemConstant.TYPES,buildingService.getBuildingTypeMap());
		mav.addObject(SystemConstant.DISTRICTS,buildingService.getDistrictMap());
		initMessageResponse(mav, request);
		return mav;
	}

	/**add new building
	 *
	 * @return
	 */
	/*@RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
	public ModelAndView buildingEdit(@RequestParam(name = "id", required = false) Long buildingId) {
		ModelAndView mav = new ModelAndView("admin/building/edit");
		BuildingDTO buildingDTO;
		if (buildingId != null) {
			buildingDTO = buildingService.findById(buildingId);
			buildingDTO.setId(buildingId);
		} else {
			buildingDTO = new BuildingDTO();
		}
		mav.addObject(SystemConstant.MODEL_ADD, buildingDTO);
		mav.addObject(SystemConstant.TYPES,buildingService.getBuildingTypeMap());
		mav.addObject(SystemConstant.DISTRICTS,buildingService.getDistrictMap());
		return mav;
	}*/
	@RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
	public ModelAndView buildingEdit() {
		ModelAndView mav = new ModelAndView("admin/building/edit");
		BuildingDTO buildingDTO = new BuildingDTO();
		mav.addObject(SystemConstant.MODEL_ADD, buildingDTO);
		mav.addObject(SystemConstant.TYPES,buildingService.getBuildingTypeMap());
		mav.addObject(SystemConstant.DISTRICTS,buildingService.getDistrictMap());
		return mav;
	}

	/**edit building
	 *
	 * @return
	 */
	@RequestMapping(value = "/admin/building-edit-{buildingid}", method = RequestMethod.GET)
	public ModelAndView buildingEdit(@PathVariable("buildingid") Long buildingId) {
		ModelAndView mav = new ModelAndView("admin/building/edit");
//		mav.addObject("modelAdd", new BuildingDTO());
		BuildingDTO buildingDTO = buildingService.findById(buildingId);
		buildingDTO.setId(buildingId);
		mav.addObject(SystemConstant.MODEL_ADD, buildingDTO);
        mav.addObject(SystemConstant.TYPES,buildingService.getBuildingTypeMap());
        mav.addObject(SystemConstant.DISTRICTS,buildingService.getDistrictMap());
		return mav;
	}

	private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
		String message = request.getParameter("message");
		if (message != null && StringUtils.isNotEmpty(message)) {
			Map<String, String> messageMap = messageUtil.getMessage(message);
			mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
			mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
		}
	}

}
