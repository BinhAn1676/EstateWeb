package com.laptrinhjavaweb.constant;

public class SystemConstant {
    /*Spring security 4: ROLE_ADMIN, Spring security 3 not required*/
    public static final String ADMIN_ROLE = "ROLE_MANAGER";
    /*Spring security 4: ROLE_ADMIN, Spring security 3 not required*/
    public static final String USER_ROLE = "ROLE_STAFF";
    public static final String MANAGER_ROLE = "ROLE_MANAGER";
    public static final String STAFF_ROLE = "ROLE_STAFF";
    //public static final String MANAGER_ROLE = "MANAGER";
    public static final String HOME = "/trang-chu";
    public static final String ADMIN_HOME = "/admin/home";
    public static final String MODEL = "model";
    public static final String STAFFS = "staffmaps";
    public static final String TYPES = "typemaps";
    public static final String DISTRICTS = "districtmaps";
    public static final String MODEL_ADD = "modelAdd";
    public static final String INSERT_SUCCESS = "insert_success";
    public static final String UPDATE_SUCCESS = "update_success";
    public static final String DELETE_SUCCESS = "delete_success";
    public static final String ERROR_SYSTEM = "error_system";
    public static final String ALERT = "alert";
    public static final String MESSAGE_RESPONSE = "messageResponse";
    public static final String PASSWORD_DEFAULT = "123456";
    public static final String CHANGE_PASSWORD_FAIL = "change_password_fail";
    public static final String ONE_EQUAL_ONE = " where 1 = 1";
    public static final String BUILDING_NOT_FOUND = "cant find the building";
    public static final String CUSTOMER_NOT_FOUND = "cant find the customer";
}
