package everyBB.common.code;

public enum Code {
	
	//DOMAIN("http://pclass.com")
	DOMAIN("http://localhost:9090"),
	EMAIL("hksthgml@naver.com"),
	//UPLOAD("C:\\CODE\\E_SERVLET\\resources\\upload\\");
	UPLOAD("C:\\CODE\\E_SERVLET\\resources\\upload\\"),
	RH01("예약"),
	RH02("확인"),
	RH03("픽업"),
	RH04("반환(리뷰가능)"),
	RH05("리뷰남김"),
	RH06("리뷰삭제"),
	RH09("거절");
	
	public String desc;
	
	Code(String desc){
		this.desc = desc;
	}
	
	public String toString() {
		return desc;
	}
}
