package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerRequest;
import com.laptrinhjavaweb.dto.response.CustomerResponseDTO;
import com.laptrinhjavaweb.dto.response.TransactionDTO;
import com.laptrinhjavaweb.enums.TransactionEnum;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.ITransactionService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import com.laptrinhjavaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    private MessageUtils messageUtil;

    @Autowired
    private IUserService userService;

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private ITransactionService transactionService;

    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute("modelSearch") CustomerRequest customerRequest,
                                     HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        //phan trang
        DisplayTagUtils.of(request, customerRequest);
        List<CustomerResponseDTO> customerResponseDTOS = customerService.findCustomer(customerRequest,new PageRequest(
                customerRequest.getPage() - 1, customerRequest.getMaxPageItems()));
        customerRequest.setListResult(customerResponseDTOS);
        customerRequest.setTotalItems(customerService.countTotalItems(customerRequest));
        mav.addObject("modelSearch", customerRequest);
        mav.addObject(SystemConstant.STAFFS,userService.getStaffMap());
        initMessageResponse(mav, request);
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit() {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = new CustomerDTO();
        mav.addObject(SystemConstant.MODEL_ADD, customerDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit-{customerid}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable("customerid") Long customerId) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findById(customerId);
        customerDTO.setId(customerId);
        mav.addObject(SystemConstant.MODEL_ADD, customerDTO);

        //transaction
        Map<String, List<TransactionDTO>> enumTransactions = new HashMap<>();
        for (TransactionEnum enumValue : TransactionEnum.values()) {
            List<TransactionDTO> transactions = transactionService.getTransactionsByTypeAndId(enumValue.toString(),customerId);
            enumTransactions.put(enumValue.getTransactionValue(), transactions);
        }
        mav.addObject("enumTransactions", enumTransactions);

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
