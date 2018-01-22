package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.UserMapper;
import model.Email;
import model.Leave;
import model.User;
import service.inter.IUserService;

@Service
@Transactional(readOnly=true)
public class UserService implements IUserService{

	@Autowired
	UserMapper mapper;
	
	@Override
	public User findByName(User user){
		return mapper.selectByName(user);
	}

	@Override
	@Transactional(readOnly=false)
	public Integer updateUser(User user) {
		// TODO Auto-generated method stub
		return mapper.saveUser(user);
	}

	@Override
	@Transactional(readOnly=false)
	public Integer updateUserRoot(User user) {
		// TODO Auto-generated method stub
		return mapper.saveUserRoot(user);
	}

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return mapper.findAllUser();
	}

	@Override
	@Transactional(readOnly=false)
	public void insertUser(User user) {
		mapper.insertUser(user);
		
	}

	@Override
	public List<Leave> findLeave(String username) {
		// TODO Auto-generated method stub
		return mapper.findLeave(username);
	}

	@Override
	@Transactional(readOnly=false)
	public void insertLeaveReason(Leave leave) {
		mapper.insertLeaveReason(leave);
		
	}

	@Override
	public List<Leave> findLeaveByCheckman(String checkman) {
		// TODO Auto-generated method stub
		return mapper.findLeaveByCheckman(checkman);
	}

	@Override
	@Transactional(readOnly=false)
	public void updateStatus(Integer id) {
		// TODO Auto-generated method stub
		mapper.updateStatus(id);
	}
	@Override
	@Transactional(readOnly=false)
	public void updateStatus2(Integer id) {
		mapper.updateStatus2(id);
		
	}

	//发送邮件
	@Override
	@Transactional(readOnly=false)
	public void insertEmail(Email email) {
		mapper.insertEmail(email);
		
	}

	//接收邮件
	@Override
	public  List<Email> findEmailByreceiveUser(String receiveUser) {
		// TODO Auto-generated method stub
		return mapper.findEmailByreceiveUser(receiveUser);
	}
	//是否删除进入回收站
	@Override
	@Transactional(readOnly=false)
	public void updateIsgarageById(Integer id) {
		// TODO Auto-generated method stub
		 mapper.updateIsgarageById(id);
	}
	@Override
	@Transactional(readOnly=false)
	public void updateIsgarageById2(Integer id) {
		mapper.updateIsgarageById2(id);
		
	}
	//垃圾邮件箱操作之彻底删除
	
	@Override
	@Transactional(readOnly=false)
	public void DeleteEmailReallyById(Integer id) {
		mapper.DeleteEmailReallyById(id);
		
	}

	@Override
	public List<Email> findAllEmailByIsgarage(Email email) {
		// TODO Auto-generated method stub
		return mapper.findAllEmailByIsgarage(email);
	}
	//通过id查找指定的邮件（读取功能）
	@Override
	public Email findEmailById(Integer id) {
		// TODO Auto-generated method stub
		return mapper.findEmailById(id);
	}
	//更新是否未读状态(查看邮件详细信息后返回邮件列表)
	@Override
	@Transactional(readOnly=false)
	public void updateIsreadById(Integer id) {
		mapper.updateIsreadById(id);
		
	}

	@Override
	public List<User> findAllAdmin(Integer isadmin) {
		// TODO Auto-generated method stub
		return mapper.findAllAdmin(isadmin);
	}
//审核请假详情
	@Override
	public Leave findLeaveById(Integer id) {
		// TODO Auto-generated method stub
		return mapper.findLeaveById(id);
	}




	
	
	
}
