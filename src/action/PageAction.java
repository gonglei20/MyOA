package action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Leave;
import service.inter.IUserService;

@Controller
@RequestMapping(value = "/user")
public class PageAction {

	@RequestMapping("/forwardPersonInfo.do")
	public String toPersonInfo() {

		return "personInfo";
	}

	@RequestMapping("/forwardPersonAccount.do")
	public String toPersonAccount() {

		return "personAccount";
	}

	@RequestMapping("/forwardEditPersonInfo.do")
	public String toEditPersonInfo() {

		return "editPersonInfo";
	}

	// 个人权限-编辑数据
	@RequestMapping("/forwardEditPersonAccount.do")
	public String toEditPersonAccount() {

		return "editPersonAccount";
	}

	// 管理权限
	@RequestMapping("/forwardAdminAccount.do")
	public String toAdminAccount() {

		return "adminAccount";
	}

	// 添加账户
	@RequestMapping("/forwardAddPersonAccount.do")
	public String toAddPersonAccount() {

		return "addPersonAccount";
	}

}
