package everyBB.common.code;

public enum Code {
	
	//DOMAIN("http://pclass.com")
	DOMAIN("http://localhost:9090"),
	EMAIL("hksthgml@naver.com"),
	//UPLOAD("C:\\CODE\\E_SERVLET\\resources\\upload\\");
	UPLOAD("C:\\CODE\\E_SERVLET\\semiProject\\WebContent\\upload\\"),
	RH01("예약"),
	RH02("수락"),
	RH03("결제"),
	RH04("픽업"),
	RH05("반납(리뷰가능)"),
	RH06("리뷰남김"),
	RH07("리뷰삭제"),
	RH08("취소"),
	RH09("거절");
	
	public String desc;
	
	Code(String desc){
		this.desc = desc;
	}
	
	public String toString() {
		return desc;
	}
}
