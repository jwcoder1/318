package org.esy.ord.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.esy.base.common.BaseUtil;
import org.esy.base.dao.YSDao;
import org.esy.base.dao.core.PageResult;
import org.esy.base.service.IAttachmentService;
import org.esy.base.util.YESUtil;
import org.esy.base.util.YesException;
import org.esy.ord.entity.Contacr;
import org.esy.ord.entity.Contbah;
import org.esy.ord.entity.view.Contbahv;
import org.esy.ord.service.IContbahService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ContbahServiceImpl implements IContbahService {

	@Autowired
	private YSDao dao;

	@Autowired
	private IAttachmentService attachmentService;

	/**
	 * 保存实体
	 * 
	 * @param Contbahv
	 * @return Contbah o
	 * @version v2.0
	 */
	@Override
	@Transactional
	public Contbah save(Contbah o) throws YesException {
		if (BaseUtil.isNotEmpty(o.getUid())) {

			Contbah old = dao.getByUid(Contbah.class, o.getUid());
			if (BaseUtil.isEmpty(old)) {
				throw new YesException(HttpStatus.NOT_FOUND, "记录不存在，不可更新!!!");
			}
			if (!YESUtil.getDatetimeString(old.getUpdstamp()).equals(YESUtil.getDatetimeString(o.getUpdstamp()))) {
				throw new YesException(HttpStatus.INTERNAL_SERVER_ERROR, "该记录已被其他用户修改，不可更新!!！");
			}
		}
		if (BaseUtil.isEmpty(o.getNbr())) {
			throw new YesException(HttpStatus.NOT_FOUND, "合约编号不可为空!!!");
		}

		Map<String, Object> q = new HashMap<String, Object>();
		q.put("attachmentId", o.getFile_nbr());
		attachmentService.updateBinds(q);

		List<Contacr> contacrs = o.getContacrs();
		if (BaseUtil.isNotEmpty(o.getUid())) {
			Contacr f = new Contacr();
			f.setHuid(o.getUid());
			dao.deleteList(Contacr.class, f);
		}

		o = dao.save(o);
		for (Contacr contacr : contacrs) {
			contacr.setUid(o.getUid());
			contacr.setNbr(o.getNbr());
			dao.save(contacr);
		}

		return o;
	}

	/**
	 * 通过uid查找实体
	 * 
	 * @param uid
	 * @return Contbah o @ version v2.0
	 * 
	 */
	@Override
	public Contbah getByUid(String uid) {
		Contbah o = dao.getByUid(Contbah.class, uid);
		o.setContacrs(dao.getlist(Contacr.class, new Contacr(o.getUid())));
		return o;
	}

	/**
	 * 删除实体
	 * 
	 * @param Contbahv
	 *            o
	 * @return boolean @ version v2.0
	 */
	@Override
	@Transactional
	public boolean delete(Contbah o) throws YesException {

		Contbah old = dao.getByUid(Contbah.class, o.getUid());
		if (BaseUtil.isNotEmpty(old)) {
			throw new YesException(HttpStatus.INTERNAL_SERVER_ERROR, "记录不存，不可删除!!!");
		}
		if (!YESUtil.getDatetimeString(old.getUpdstamp()).equals(YESUtil.getDatetimeString(o.getUpdstamp()))) {
			throw new YesException(HttpStatus.INTERNAL_SERVER_ERROR, "该记录已被其他用户修改，不可删除!!！");
		}
		return dao.delete(o);
	}

	/**
	 * 查询实体
	 * 
	 * @param Map<String,
	 *            Object> parm
	 * @return QueryResult @ version v2.0
	 */
	@Override
	public PageResult<Contbahv> query(Contbahv contbah, Pageable pageable) {
		return (PageResult<Contbahv>) dao.query(Contbahv.class, contbah, pageable);
	}

	@Override
	@Transactional
	public void deletes(String uids) throws YesException {
		// TODO Auto-generated method stub

		String[] uidsArr = uids.split(",");
		for (String uid : uidsArr) {

			Contbah old = dao.getByUid(Contbah.class, uid);
			if (BaseUtil.isEmpty(old)) {
				throw new YesException(HttpStatus.INTERNAL_SERVER_ERROR, "记录不存，不可删除!!!");
			}
			dao.deleteList(Contacr.class, new Contacr(old.getUid()));

			dao.delete(old);
		}

	}

}