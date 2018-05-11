package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.app.annotation.LoginUser;
import tech.yiyehu.modules.app.entity.AidOrderEntity;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.service.AidOrderService;
import tech.yiyehu.modules.app.service.UserService;
import tech.yiyehu.modules.app.utils.Constant;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;

/**
 * 帮帮订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-05-07 10:40:17
 */
@RestController
@RequestMapping("app/aidorder")
public class AidOrderController {
	@Autowired
	private AidOrderService aidOrderService;
	@Autowired
	private UserService userService;

	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {
		params.put("orderBy", "create_time desc");
		PageUtils page = aidOrderService.queryPage(params);

		return R.ok().put("page", page);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{aidId}")
	@RequiresPermissions("app:aidorder:info")
	public R info(@PathVariable("aidId") Long aidId) {
		AidOrderEntity aidOrder = aidOrderService.selectById(aidId);

		return R.ok().put("aidOrder", aidOrder);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("app:aidorder:save")
	public R save(@RequestBody AidOrderEntity aidOrder) {
		aidOrderService.insert(aidOrder);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("app:aidorder:update")
	public R update(@RequestBody AidOrderEntity aidOrder) {
		aidOrderService.updateById(aidOrder);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("app:aidorder:delete")
	public R delete(@RequestBody Long[] aidIds) {
		aidOrderService.deleteBatchIds(Arrays.asList(aidIds));

		return R.ok();
	}

	/**
	 * 列表
	 */
	@Login
	@RequestMapping("/listOfLogin")
	public R listOfLogin(@RequestParam Map<String, Object> params, @RequestAttribute("userId") Long userId) {
		params.put("userId", userId);
		params.put("orderBy", "create_time desc");
		PageUtils page = aidOrderService.queryPage(params);
		return R.ok().put("page", page);
	}

	/**
	 * 信息ofLogin
	 */
	@Login
	@GetMapping("/{aidId}")
	public R infoOfLogin(@PathVariable("aidId") Long aidId, @RequestAttribute("userId") Long userId) {
		AidOrderEntity aidOrder = aidOrderService.selectById(aidId);
		UserEntity creator = null;
		UserEntity receiver = null;
		if (userId == aidOrder.getCreatorId() || userId == aidOrder.getReceiverId()) {
			creator = userService.selectById(aidOrder.getCreatorId());
			userService.clearInformation(creator);
			if (aidOrder.getStatus() > 0) {
				receiver = userService.selectById(aidOrder.getReceiverId());
				userService.clearInformation(receiver);
			}
		}
		return R.ok().put("aidOrder", aidOrder).put("creator", creator).put("receiver", receiver);
	}

	/**
	 * 保存ofLogin
	 */
	@Login
	@PostMapping("/saveOfLogin")
	public R saveOfLogin(@RequestBody AidOrderEntity aidOrder,@RequestAttribute("userId") Long userId) {
		aidOrder.setStatus(0);
		aidOrder.setCreatorId(userId);
		aidOrder.setCreateTime(new Date());
		aidOrderService.insert(aidOrder);
		return R.ok();
	}

	/**
	 * 接单用户接单
	 */
	@Login
	@PutMapping("/receiveAidOrder")
	public R receiveAidOrder(@RequestParam Long aidId, @RequestParam(required = false) String contact,
			@LoginUser UserEntity user) {
		AidOrderEntity aidOrder = new AidOrderEntity();
		aidOrder.setReceiverId(user.getUserId());
		if (contact != null && "".equals(contact)) {
			aidOrder.setReceiverContact(contact);
		} else {
			aidOrder.setReceiverContact(user.getMobile());
		}
		aidOrder.setStatus(Constant.BangBangStatusEnum.RECEIVED.ordinal());
		aidOrder.setAidId(aidId);
		aidOrderService.updateById(aidOrder);
		return R.ok();
	}

	/**
	 * 帮帮订单创建人确认订单结束
	 */
	@Login
	@PutMapping("/finishOrder")
	public R finishOrder(@RequestParam Long aidId, @LoginUser UserEntity user) {
		AidOrderEntity aidOrder = new AidOrderEntity();
		aidOrder.setStatus(Constant.BangBangStatusEnum.FINISHED.ordinal());
		aidOrder.setAidId(aidId);
		aidOrderService.updateById(aidOrder);
		return R.ok();
	}

	/**
	 * 帮帮订单创建人确认订单结束
	 */
	@Login
	@PutMapping("/creatorComment")
	public R creatorComment(@RequestParam Map<String, Object> params, @RequestAttribute("userId") Long userId) {
		if (aidOrderService.selectById(Long.parseLong(params.get("aidId").toString())).getCreatorId() == userId) {
			AidOrderEntity aidOrder = new AidOrderEntity();
			aidOrder.setAidId(Long.parseLong(params.get("aidId").toString()));
			aidOrder.setStatus(Constant.BangBangStatusEnum.COMMENTED.ordinal());
			if (params.get("commentStar") != null && params.get("commentStar").toString() != ""
					&& Integer.parseInt(params.get("").toString()) != 0) {
				aidOrder.setCommentStar(Integer.parseInt(params.get("").toString()));
			}
			if (params.get("commentThing") != null && params.get("commentThing").toString() != "") {
				aidOrder.setCommentThing(params.get("commentThing").toString());
			}
			aidOrderService.updateById(aidOrder);
			return R.ok();
		} else {
			return R.error("订单所属人与用户不匹配，不可评论");
		}
	}

	/**
	 * 更新OfLogin
	 */
	@Login
	@PutMapping("/{aidId}")
	public R updateOfLogin(@RequestBody AidOrderEntity aidOrder, @PathVariable("aidId") Long aidId) {
		if (aidOrder.getAidId() != aidId) {
			return R.error("更新出错");
		}
		aidOrderService.updateById(aidOrder);
		return R.ok();
	}

	/**
	 * 删除ofLogin
	 */
	@Login
	@DeleteMapping("/{aidId}")
	public R deleteOfLogin(@PathVariable("aidId") Long aidId, @RequestAttribute("userId") Long userId) {
		if (aidOrderService.selectById(aidId).getCreatorId() == userId) {
			aidOrderService.deleteById(aidId);
		} else {
			return R.error("订单所属人与用户不匹配，删除失败");
		}
		return R.ok();
	}

}
