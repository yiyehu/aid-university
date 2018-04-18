package tech.yiyehu.common.utils;

import java.util.Map;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

public class SqlUtils {

	public static <T> EntityWrapper<T> AddSearchOper(EntityWrapper<T> ew, Map<String, Object> params) {
		if ("eq".equals(params.get("searchOper").toString())) {
			ew.eq(params.get("searchField").toString(), params.get("searchString").toString());
		} else if ("ne".equals(params.get("searchOper").toString())) {// 不等
			ew.ne(params.get("searchField").toString(), params.get("searchString").toString());
		} else if ("like".equals(params.get("searchOper").toString())) {// 相似
			ew.like(params.get("searchField").toString(), params.get("searchString").toString());
		} else if ("notlike".equals(params.get("searchOper").toString())) {// 不相似
			ew.like(false, params.get("searchField").toString(), params.get("searchString").toString());
		}
		return ew;
	}
}