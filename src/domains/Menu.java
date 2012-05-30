package domains;

import org.nutz.dao.entity.annotation.*;

@Table("menu")
public class Menu {
	@Id
	private Long id;
	@Name
	private String name;
	@Column
	private String url;
	@Column
	private String mtype;// 区分 menu , 友情连接等需要url的地方{menu,linked}
	@Column
	private int morder; // 从小到大 ,递增
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public int getMorder() {
		return morder;
	}
	public void setMorder(int morder) {
		this.morder = morder;
	}
}
