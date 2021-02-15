package everyBB.common.code;

public enum ErrorCode {
	
	SM01("회원정보를 조회하는 도중 에러가 발생하였습니다.", "/member/login"),
	SM02("아이디나 패스워드가 틀렸습니다.", "/member/login"),
	IM01("회원정보를 입력하는 도중 에러가 발생하였습니다.", "/member/join"),
	UM01("회원정보 수정 중 에러가 발생하였습니다."),
	DM01("회원정보 삭제 중 에러가 발생하였습니다."),
	UC01("자동차 정보를 수정하는 중 에러가 발생하였습니다."),
	SC01("자동차 정보를 조회하는 중 에러가 발생하였습니다."),
	rg01("자동차 등록하는 중 에러가 발생하였습니다."),
	rg02("자동차 정보를 등록하는 중 에러가 발생하였습니다."),
	rg03("자동차 정보를 조회하는 중 에러가 발생하였습니다."),
	rg04("자동차 정보를 수정하는 중 에러가 발생하였습니다."),
	rg05("자동차 정보를 수정하는 중 에러가 발생하였습니다."),
	IR01("예약 정보를 입력하는 중 에러가 발생하였습니다."),
	SR01("예약 정보를 조회하는 중 에러가 발생하였습니다."),
	IH01("예약 이력 정보를 입력하는 중 에러가 발생하였습니다."),
	SH01("예약 이력 정보를 조회하는 중 에러가 발생하였습니다."),
	IW01("리뷰 정보를 입력하는 중 에러가 발생하였습니다."),
	UW01("리뷰 정보를 수정하는 중 에러가 발생하였습니다."),
	SW01("리뷰 정보를 조회하는 중 에러가 발생하였습니다."),
	DW01("리뷰 정보를 삭제하는 중 에러가 발생하였습니다."),
	IB01("게시판 정보를 입력하는 중 에러가 발생하였습니다."),
	SB01("게시판 정보를 조회하는 중 에러가 발생하였습니다."),
	IF01("파일 정보를 입력하는 중 에러가 발생하였습니다."),
	IF02("파일을 삭제하는 중 에러가 발생하였습니다."),
	SF01("파일 정보를 조회하는 중 에러가 발생하였습니다."),
	AUTH01("접근 권한이 없는 페이지입니다."),
	MAIL01("이메일 발송 중 에러가 발생하였습니다."),
	AUTH02("이미 만료된 인증입니다."),
	HTTP01("HTTP 통신 중 에러가 발생하였습니다."),
	DATE01("Date 포맷 변환 중 에러가 발생하였습니다."),
	RSRV01("이미 예약 되어 있는 시간이 포함되어 있습니다."),
	RSRV02("예약하는데 필요한 면허번호가 없습니다.", "/member/mypage/userinfomodify"),
	RSRV03("예약하는데 필요한 전화번호가 없습니다.", "/member/mypage/userinfomodify"),
	RH01("이미 진행중인 예약입니다."),
	RH02("이미 수락한 예약입니다."),
	RH09("이미 거절한 예약입니다."),
	CD_404("존재하지 않는 경로입니다.");
	
	public String errMsg;
	public String url = "/index";
	
	//에러 발생 시 index로 이동
	ErrorCode(String errMsg) {
		this.errMsg = errMsg;
	}
	
	//에러 발생 시 지정한 페이지로 이동
	ErrorCode(String errMsg, String url){
		this.errMsg = errMsg;
		this.url = url;
	}

}
