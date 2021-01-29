package everyBB.common.code;

public enum Code {
	
	//DOMAIN("http://pclass.com")
	DOMAIN("http://localhost:9090"),
	EMAIL("hksthgml@naver.com"),
	//UPLOAD("C:\\CODE\\E_SERVLET\\resources\\upload\\");
	UPLOAD("C:\\CODE\\E_SERVLET\\resources\\upload\\");
	
	public String desc;
	
	Code(String desc){
		this.desc = desc;
	}
	
	public String toString() {
		return desc;
	}
}
