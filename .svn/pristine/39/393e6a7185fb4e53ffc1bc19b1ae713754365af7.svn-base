package org.esy.ord.service.impl;

//import java.text.SimpleDateFormat;//引入
import java.util.HashMap;
import java.util.Map;

//import org.esy.base.service.ISerialService;//引入
import org.esy.base.common.BaseUtil;
import org.esy.base.dao.YSDao;
import org.esy.base.dao.core.PageResult;
import org.esy.base.service.IAttachmentService;
import org.esy.base.util.YESUtil;
import org.esy.base.util.YesException;
import org.esy.ord.entity.Contacr;
import org.esy.ord.entity.Contbah;
import org.esy.ord.entity.view.Contbahv;  //**
import org.esy.ord.entity.view.Contcasev; //***
import org.esy.ord.service.IContcaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ContcaseServiceImpl implements IContcaseService {

	@Autowired
	private YSDao dao;
	
	@Autowired
	private IAttachmentService attachmentService;  //上傳文件加寫

	/**
	 * 保存实体
	 * 
	 * @param Contbahv
	 * @return Contbah o
	 * @version v2.0
	 */
	@Transactional
	public Contcasev save(Contcasev o) throws YesException {
		if (BaseUtil.isNotEmpty(o.getUid())) {

			Contbahv old = dao.getByUid(Contbahv.class, o.getUid());
			if (BaseUtil.isEmpty(old)) {
				throw new YesException(HttpStatus.NOT_FOUND, "记录不存在，不可更新!!!");
			}
			if (!YESUtil.getDatetimeString(old.getUpdstamp()).equals(YESUtil.getDatetimeString(o.getUpdstamp()))) {
				throw new YesException(HttpStatus.INTERNAL_SERVER_ERROR, "该记录已被其他用户修改，不可更新!!！");
			}
		}
		
		if (BaseUtil.isEmpty(o.getNbr())) {  //判斷欄位是否為空(o.get..()可變換，這邊用Nbr())
			throw new YesException(HttpStatus.NOT_FOUND, "合约编号不可为空!!!");
		}
		
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMM");
//		String date = "S" + YESUtil.getDateString(o.getNbrdate(), formatter);    //自動生成
//		String no = serialService.getSerialString("ord", "ordbah", date, 5, 99999);
//		o.setNbr(no);
		
		Map<String, Object> q = new HashMap<String, Object>();
		q.put("attachmentId", o.getFile_nbr());                    //這三行為上傳文件加寫
		attachmentService.updateBinds(q);
		o = dao.save(Contbah.class, o);
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
	public Contbahv getByUid(String uid) {
		Contbahv o = dao.getByUid(Contcasev.class, uid);
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
	public boolean delete(Contcasev o) throws YesException {

		Contcasev old = dao.getByUid(Contcasev.class, o.getUid());
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
	public PageResult<Contcasev> query(Contcasev contbah, Pageable pageable) {
		return (PageResult<Contcasev>) dao.query(Contcasev.class, contbah, pageable);
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

	@Override
	public boolean delete(Contbahv o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Contbahv save(Contbahv o) {
		// TODO Auto-generated method stub
		return null;
	}

	
}