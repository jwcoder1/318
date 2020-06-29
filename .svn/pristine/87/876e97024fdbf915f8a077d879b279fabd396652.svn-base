package org.esy.acr.service;

import org.esy.acr.entity.Tempbat;
import org.esy.base.dao.core.PageResult;
import org.springframework.data.domain.Pageable;

/**
 * @author <a href="mailto:ardui@163.com">ardui</a>
 * @date Fri Jun 19 16:20:53 CST 2020
 *
 * @version v2.0
 */
public interface ITempbatService  {
    
    Tempbat save(Tempbat o);

	Tempbat getByUid(String uid);

	boolean delete(Tempbat o);

	PageResult<Tempbat> query(Tempbat tempbat, Pageable pageable);
     
     void deletes(String uids);
}