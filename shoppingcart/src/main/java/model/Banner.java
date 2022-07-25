package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the banner database table.
 * 
 */
@Entity
@NamedQuery(name="Banner.findAll", query="SELECT b FROM Banner b")
public class Banner implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String picid;

	private String path;

	private String picname;

	public Banner() {
	}

	public String getPicid() {
		return this.picid;
	}

	public void setPicid(String picid) {
		this.picid = picid;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPicname() {
		return this.picname;
	}

	public void setPicname(String picname) {
		this.picname = picname;
	}

}