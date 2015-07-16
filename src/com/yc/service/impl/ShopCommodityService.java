package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopCommodity;
import com.yc.service.IShopCommodityService;

@Component
public class ShopCommodityService extends GenericService<ShopCommodity> implements IShopCommodityService {

	@Autowired
	GenericDao<ShopCommodity> ShopCommodityDao;
	
	@Override
	GenericDao<ShopCommodity> getDao() {
		return ShopCommodityDao;
	}

	@Override
	public List<ShopCommodity> getAllByShop(Integer id) {
		return ShopCommodityDao.getBy("belongTo.id", id);
	}

	@Override
	public List<ShopCommodity> getAllByCondition(String condition, boolean isTrue, Integer shopID) {
		 List<String> keys = new ArrayList<String>();
	        keys.add(condition);
	        keys.add("belongTo.id");
	        List<Object> values = new ArrayList<Object>();
	        values.add(isTrue?1:0);
	        values.add(shopID);
		return ShopCommodityDao.getBy(keys,values );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> getAllByShopCategoryID(Integer id,String page,int one ,int last) {
		StringBuffer hql = new StringBuffer("SELECT shc.* FROM ShopCommodity shc JOIN Shop shop ON shop.id = shc.shop_id WHERE (shc.blacklist_id IS NULL AND shop.blacklist_id IS NULL AND shc.shelves = 1 ) AND shc.shop_id IS NOT NULL AND shc.shopCategory_id ="+id);
		if (page.equals("brand")) {
			hql.append(" and shc.brand_id is not null");
		}
		if (page.equals("special")) {
			hql.append(" and shc.isSpecial = 1");
		}
		if(one !=-1 && last != -1){
			hql.append(" LIMIT "+one+","+last+"");
		}
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		List<ShopCommodity> list = query.getResultList();
		return list;
	}

	//Integer id, String brand, String specs, String money
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> getAllByParams(Map<String, Object> map,String page ) {
		StringBuffer hql = new StringBuffer("select DISTINCT shc.* from ShopCommodity shc JOIN Shop shop ON shop.id = shc.shop_id LEFT join ShopCommoditySpecs sp on shc.commCode = sp.shopComm_id ");
//		if(map.get("haoping") != null && !map.get("haoping").equals("")){
//			hql.append(" left join ShopReviews shopReviews on shopReviews.shopcomm_id = shc.commCode");
//		}
		hql.append(" where (shc.blacklist_id IS NULL AND shop.blacklist_id IS NULL AND shc.shelves = 1 ) and shc.shelves = 1");
		if (page.equals("special")) {
			hql.append(" and shc.isSpecial = 1");
		}
		if (page.equals("brand")) {
			hql.append(" and shc.brand_id is not null");
		}
		String[] spec = null;
		if (map.get("specs") != null && !map.get("specs").equals("")) {
			if (map.get("specs").toString().contains("@")) {
				spec =map.get("specs").toString().split("@");
				for (int i = 0; i < spec.length; i++) {
					hql.append(" and ('"+spec[i]+"' is null or sp.commSpec like '"+spec[i]+"') ");
				}
			}else{
				hql.append(" and ('"+map.get("specs")+"' is null or sp.commSpec like '"+map.get("specs")+"') ");
			}
		}
		if (map.get("money") != null && !map.get("money").equals("")) {
			if (!map.get("money").toString().split("@")[0].equals("")) {
				 hql.append(" and ("+map.get("money").toString().split("@")[0]+" is null or shc.unitPrice >= "+map.get("money").toString().split("@")[0]+")");
			}
			if (!map.get("money").toString().split("@")[1].equals("")) {
				hql.append(" and ("+map.get("money").toString().split("@")[1]+" is null or shc.unitPrice < "+map.get("money").toString().split("@")[1]+")");
			}
		}
		if (map.get("cateid") != null && !map.get("cateid").equals("")) {
			 hql.append(" and shc.shopCategory_id = "+map.get("cateid"));
		}
		if (map.get("brand") != null && !map.get("brand").equals("")) {
			 hql.append(" and (shc.brand_id in "+map.get("brand")+")");
		}
		if (map.get("famousids") != null && !map.get("famousids").equals("")) {
			 hql.append(" and (shc.famousManor_id in "+map.get("famousids")+")");
		}
		if(map.get("orderByXiao") != null || map.get("orderByPice") != null || map.get("haoping") != null){
			hql.append(" order by "); 
		}
		if (map.get("orderByXiao") != null && !map.get("orderByXiao").equals("")) {
			hql.append(" salesVolume  "+map.get("orderByXiao"));
		}
		if (map.get("orderByPice") != null && !map.get("orderByPice").equals("")) {
			hql.append(" unitPrice  "+map.get("orderByPice"));
		}
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		List<ShopCommodity> list = query.getResultList();
		return list;
	}

	@Override
	public List<ShopCommodity> getAllByParamsForParent(Map<String, Object> map, String page) {
		StringBuffer hql = new StringBuffer("select DISTINCT shc.* from ShopCommodity shc JOIN Shop shop ON shop.id = shc.shop_id LEFT join ShopCommoditySpecs sp on shc.commCode = sp.shopComm_id ");
		if((map.get("alcoholicStrength") != null && !map.get("alcoholicStrength").equals(""))||(map.get("particularYear") != null && !map.get("particularYear").equals(""))){
			hql.append(" join ShopCommodityAttribute attr on attr.shopcomm_id = shc.commCode ");
		}
		hql.append(" where  (shc.blacklist_id IS NULL AND shop.blacklist_id IS NULL AND shc.shelves = 1 ) and shc.shelves = 1");
		if (map.get("cateid") != null && !map.get("cateid").equals("")) {
			 hql.append(" and shc.shopCategory_id IN (SELECT cate.categoryID FROM shopcategory cate WHERE cate.parentLevel IN ( SELECT cate2.categoryID FROM shopcategory cate2 WHERE cate2.parentLevel = "+map.get("cateid")+"))");
		}
		if (page.equals("special")) {
			hql.append(" and shc.isSpecial = 1");
		}
		if (page.equals("brand")) {
			hql.append(" and shc.brand_id is not null");
		}
		String[] spec = null;
		if (map.get("specs") != null && !map.get("specs").equals("")) {
			if (map.get("specs").toString().contains("@")) {
				spec =map.get("specs").toString().split("@");
				for (int i = 0; i < spec.length; i++) {
					hql.append(" and ('"+spec[i]+"' is null or sp.commSpec like '"+spec[i]+"') ");
				}
			}else{
				hql.append(" and ('"+map.get("specs")+"' is null or sp.commSpec like '"+map.get("specs")+"') ");
			}
		}
		if (map.get("alcoholicStrength") != null && !map.get("alcoholicStrength").equals("")) {
			if (!map.get("alcoholicStrength").toString().split("@")[0].equals("")) {
				 hql.append(" and ("+map.get("alcoholicStrength").toString().split("@")[0]+" is null or attr.alcoholDegree >= "+map.get("alcoholicStrength").toString().split("@")[0]+")");
			}
			if (!map.get("alcoholicStrength").toString().split("@")[1].equals("")) {
				hql.append(" and ("+map.get("alcoholicStrength").toString().split("@")[1]+" is null or attr.alcoholDegree < "+map.get("alcoholicStrength").toString().split("@")[1]+")");
			}
		}
		if (map.get("money") != null && !map.get("money").equals("")) {
			if (!map.get("money").toString().split("@")[0].equals("")) {
				hql.append(" and ("+map.get("money").toString().split("@")[0]+" is null or shc.unitPrice >= "+map.get("money").toString().split("@")[0]+")");
			}
			if (!map.get("money").toString().split("@")[1].equals("")) {
				hql.append(" and ("+map.get("money").toString().split("@")[1]+" is null or shc.unitPrice < "+map.get("money").toString().split("@")[1]+")");
			}
		}
		if (map.get("particularYear") != null && !map.get("particularYear").equals("")) {
			if (!map.get("particularYear").toString().split("@")[0].equals("")) {
				hql.append(" and ("+map.get("particularYear").toString().split("@")[0]+" is null or attr.particularYear >= "+map.get("particularYear").toString().split("@")[0]+")");
			}
			if (!map.get("particularYear").toString().split("@")[1].equals("")) {
				hql.append(" and ("+map.get("particularYear").toString().split("@")[1]+" is null or attr.particularYear < "+map.get("particularYear").toString().split("@")[1]+")");
			}
		}
		if (map.get("brand") != null && !map.get("brand").equals("")) {
			 hql.append(" and (shc.brand_id in "+map.get("brand")+")");
		}
		if (map.get("famousids") != null && !map.get("famousids").equals("")) {
			 hql.append(" and (shc.famousManor_id in "+map.get("famousids")+")");
		}
		if(map.get("orderByXiao") != null || map.get("orderByPice") != null || map.get("haoping") != null){
			hql.append(" order by "); 
		}
		if (map.get("orderByXiao") != null && !map.get("orderByXiao").equals("")) {
			hql.append(" salesVolume  "+map.get("orderByXiao"));
		}
		if (map.get("orderByPice") != null && !map.get("orderByPice").equals("")) {
			hql.append(" unitPrice  "+map.get("orderByPice"));
		}
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		@SuppressWarnings("unchecked")
		List<ShopCommodity> list = query.getResultList();
		return list;
	}

	@Override
	public List<ShopCommodity> getAllByNameAndShop(String commoName, Integer shopID) {
		 List<String> keys = new ArrayList<String>();
	        keys.add("commoidtyName");
	        keys.add("belongTo.id");
	        List<Object> values = new ArrayList<Object>();
	        values.add(commoName);
	        values.add(shopID);
		return ShopCommodityDao.getBy(keys,values );
	}

	@Override
	public ShopCommodity getAllByCommItemAndShop(String commItem, Integer id) {
		 List<String> keys = new ArrayList<String>();
	        keys.add("commItem");
	        keys.add("belongTo.id");
	        List<Object> values = new ArrayList<Object>();
	        values.add(commItem);
	        values.add(id);
		return ShopCommodityDao.getFirstRecord(keys, values);
	}

	@Override
	public List<String> getShopCommBySpeces(String speces) {
		StringBuffer hql = new StringBuffer("select sp.commSpec from ShopCommodity sc join ShopCommoditySpecs sp on sp.shopComm_id = sc.commCode where sc.blacklist_id is null and sp.commSpec  LIKE '%,"+speces+"%'");
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList(); 
		List<String> list = new ArrayList<String>();
		for (Object object : objecArraytList) {
			list.add(object.toString());
		}
		return list;
	}

	@Override
	public List<ShopCommodity> getAllByParamsForBlack(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from ShopCommodity comm where (? is null or comm.commoidtyName like ?) and (? is null or comm.commItem = ?) and (? is null or comm.commCode = ?)");
		Object[] paramete = new Object[6];
		paramete[0] = map.get("commoidtyName");
		paramete[1] = "%"+map.get("commoidtyName")+"%";
		paramete[2] = map.get("commItem");
		paramete[3] = map.get("commItem");
		paramete[4] = map.get("commCode");
		paramete[5] = map.get("commCode");
		return ShopCommodityDao.find(hql.toString(), paramete, -1,-1);
	}

	/* (non-Javadoc)
	 * @see com.yc.service.IShopCommodityService#getShopCommByCateAndIsspecial()
	 * 根據類型和是否折扣展示商品
	 */
	@Override
	public List<ShopCommodity> getShopCommByCateAndIsspecial(Integer CateId, Boolean flag) {
		StringBuffer hql=new StringBuffer("SELECT * FROM ShopCommodity WHERE ShopCommodity.isSpecial="+flag);
		if(CateId<=1){
			hql.append("  AND ShopCommodity.shopCategory_id IS NOT NULL");
		}else{
			hql.append("  AND ShopCommodity.shopCategory_id="+CateId);
		}
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		@SuppressWarnings("unchecked")
		List<ShopCommodity> list = query.getResultList();
		return list;
	}

	
	/* (non-Javadoc)
	 * @see com.yc.service.IShopCommodityService#getShopCommByCateAndBrand(java.lang.Integer)
	 * 根据商品类型和品牌查找商品
	 */
	@Override
	public List<ShopCommodity> getShopCommByCateAndBrand(Integer id) {
		StringBuffer hql=new StringBuffer("SELECT * FROM ShopCommodity WHERE ShopCommodity.brand_id IS NOT NULL");
		if(id<=1){
			hql.append("  AND ShopCommodity.shopCategory_id IS NOT NULL");
		}else{
			hql.append("  AND ShopCommodity.shopCategory_id="+id);
		}
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		@SuppressWarnings("unchecked")
		List<ShopCommodity> list = query.getResultList();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.yc.service.IShopCommodityService#getShopCommByBrandId(java.lang.Integer)
	 * 根据品牌Id查找对应商品
	 */
	@Override
	public List<ShopCommodity> getShopCommByBrandId(Integer id) {
		StringBuffer hql=new StringBuffer("SELECT * FROM ShopCommodity WHERE ShopCommodity.brand_id ="+id);
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		@SuppressWarnings("unchecked")
		List<ShopCommodity> list = query.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> searchShopComm(String content) {
		StringBuffer hql = new StringBuffer(" select * from ShopCommodity comm left join ShopCategory c ON comm.shopcategory_id = c.categoryID left join Brand b on b.brandID = comm.brand_id where comm.commoidtyName like '%"+content+"%' or c.category like '%"+content+"%' or b.brandName like '%"+content+"%'");
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		return query.getResultList();		
	}

	@Override
	public List<ShopCommodity> getAllByFamousManorID(Integer id, int i) {
		StringBuffer hql=new StringBuffer("SELECT ShopCommodity.*  FROM ShopCommodity LEFT JOIN famousmanorandshop fms ON fms.id =  ShopCommodity.famAndShop_id  WHERE  fms.famousManor_id ="+id);
		if(i != -1){
			hql.append(" LIMIT 0,"+i);
		}
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		@SuppressWarnings("unchecked")
		List<ShopCommodity> list = query.getResultList();
		return list;
	}
	
	@Override
	public List<ShopCommodity> getFamousCommodityByShop(Integer id) {
		StringBuffer hql=new StringBuffer(" from ShopCommodity shopComm where shopComm.famousManor.id is not null and shopComm.belongTo.id = "+id);
		return ShopCommodityDao.find(hql.toString(), null, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> getAllByCommNameAndCateName(String key,
			Integer id) {
		StringBuffer hql = new StringBuffer(" select * from ShopCommodity comm left join ShopCategory c ON comm.shopcategory_id = c.categoryID left join Brand b on b.brandID = comm.brand_id where comm.commoidtyName like '%"+key+"%' or c.category like '%"+key+"%' or b.brandName like '%"+key+"%'");
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> getActivityCommodity() {
		StringBuffer hql = new StringBuffer("select * from ShopCommodity comm right join Activity act on comm.activity_id = act.activityId ");
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> getCommBycommItem(String commItem) {
		StringBuffer hql = new StringBuffer("select * from ShopCommodity comm where comm.commItem = '"+commItem+"'");
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCommodity> searchShopCommBrand(String cname,String category,Integer shopId) {
		StringBuffer hql = new StringBuffer(" select * from ShopCommodity comm left join ShopCategory c ON comm.shopcategory_id = c.categoryID left join Brand b on b.brandID = comm.brand_id left join Shop s on comm.shop_id = s.id where comm.commoidtyName like '%"+cname+"%' and c.category like '%"+category+"%' "+"and s.id = "+shopId);
		Query query = ShopCommodityDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommodity.class);
		return query.getResultList();		
	}
}
