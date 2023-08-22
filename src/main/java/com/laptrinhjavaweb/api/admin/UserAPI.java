package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.PasswordDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.request.AssignStaffRequest;
import com.laptrinhjavaweb.dto.response.ResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.exception.MyException;
import com.laptrinhjavaweb.service.IUserService;
//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UserAPI {

    //private Logger LOGGER = Logger.getLogger(UserAPI.class);

    @Autowired
    private IUserService userService;

    @PostMapping
    public ResponseEntity<UserDTO> createUsers(@RequestBody UserDTO newUser) {
        return ResponseEntity.ok(userService.insert(newUser));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> updateUsers(@PathVariable("id") long id, @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.update(id, userDTO));
    }

    @PutMapping("/change-password/{id}")
    public ResponseEntity<String> changePasswordUser(@PathVariable("id") long id, @RequestBody PasswordDTO passwordDTO) {
        try {
            userService.updatePassword(id, passwordDTO);
            return ResponseEntity.ok(SystemConstant.UPDATE_SUCCESS);
        } catch (MyException e) {
            //LOGGER.error(e.getMessage());
            return ResponseEntity.ok(e.getMessage());
        }
    }

    @PutMapping("/password/{id}/reset")
    public ResponseEntity<UserDTO> resetPassword(@PathVariable("id") long id) {
        return ResponseEntity.ok(userService.resetPassword(id));
    }

    @PutMapping("/profile/{username}")
    public ResponseEntity<UserDTO> updateProfileOfUser(@PathVariable("username") String username, @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.updateProfileOfUser(username, userDTO));
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteUsers(@RequestBody long[] idList) {
        if (idList.length > 0) {
            userService.delete(idList);
        }
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/staffs/assignment")
    public void assignStaff(@RequestBody AssignStaffRequest assignStaff){
        userService.assignStaff(assignStaff);
    }

    @GetMapping("/staffs")
    public ResponseDTO loadStaff(@RequestParam(value = "building_id",required = false) Long buildingId){
        ResponseDTO result = new ResponseDTO();
        if(buildingId!=null){
            List<StaffResponseDTO> staffs = userService.loadStaff(buildingId);
            result.setMessage("success");
            result.setData(staffs);
        }else{
            //load staff
        }
        return result;
    }
}
