package org.esy.ord.service;

import org.esy.base.dao.core.PageResult;
import org.esy.base.util.YesException;
import org.esy.ord.entity.view.Contbahv;//**
import org.esy.ord.entity.view.Contcasev;//**
import org.springframework.data.domain.Pageable;

/**
 * @author <a href="mailto:ardui@163.com">ardui</a>
 * @date Tue Jun 23 11:06:06 CST 2020
 *
 * @version v2.0
 */
public interface IContcaseService {

	Contbahv save(Contbahv o);
	Contbahv getByUid(String uid);

	boolean delete(Contbahv o);

	PageResult<Contcasev> query(Contcasev contbah, Pageable pageable);
	
	void deletes(String uids);
	/**
	 * 删除实体
	 * 
	 * @param Contbahv
	 *            o
	 * @return boolean @ version v2.0
	 */
	boolean delete(Contcasev o) throws YesException;
}