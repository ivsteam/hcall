package com.util;


public class Constant {
	public static class Path {
		//* development
		public static final String IMG_DEFAULT_PATH = "F:\\Hotel\\hotel\\src\\main\\resources\\static\\css\\img\\";
		public static final String IMG_REPLACE_PATH = "F:\\Hotel\\hotel\\src\\main\\resources\\static";
		//*/
		/* 
		public static final String IMG_DEFAULT_PATH = "";
		public static final String IMG_REAL_PATH = "";
		//*/
	}
	
    public static class Board{
        public static String NUM="num";
        public static String NAME="name";
        public static String PASS="pass";
        public static String CONTENT="content";
        public static String EMAIL="email";
        public static String READCOUNT="readCount";
        public static String WRITEDATE="writedate";
        public static String TITLE="title";
        public static String SUCCESS_FAIL = "글 작성 도중 오류가 발생하였습니다. 이용에 불편을 드려서 죄송합니다.";
        public static String SUCCESS_QUEST = "문의하신내용이 정상적으로 등록되었습니다. 이메일로 문의내용을 알려드리겠습니다.";
        public static String SUCCESS_GROUP_BOARD = "정상적으로 등록되었습니다.";
    }
    
    public static class Member{
    	public static String SIGNUP_SUCCESS = "정상적으로 회원가입이 완료되었습니다. 로그인을 해주시기바랍니다.";
    	public static String SIGNUP_FAIL = "회원가입시 오류가 발생하였습니다. 다시 회원가입 해주시기 바랍니다.";
    	public static String DUP_EMAIL = "이미 사용중인 이메일이거나 탈퇴한 이메일입니다.";
    	public static String INVALID_MAIL = "잘못된 메일 형식 입니다.";
    	public static String AVAILABLE_EMAIL = "사용 가능한 이메일 입니다.";
    	public static String USER_PW_ERROR = "비밀번호 오류";
    	public static String DUP_GRUOP_TITLE_ERROR = "중복된 그룹명입니다.";
    	public static String LOGIN_SUCCESS = "HOTEL ClickToColl 에 오신 것을 환영합니다.";
    	public static String LOGIN_FAIL = "아이디 혹은 비밀번호가 일치하지 않습니다.";
    	public static String INVALID_HOTEL_SEQ = "호텔정보가 입력되지 않습니다.";
    }
    
    public static class MemberSignup{
    	public static final String NOT_INSERT_ID = "아이디가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_ID = "아이디는 4자 이상 40자 이하만 가능합니다.";
    	public static final String NOT_INSERT_EMAIL = "메일이 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_EMAIL = "메일은 8자 이상 40자 이하만 가능합니다.";
    	public static final String NOT_VALID_EMAIL = "올바른 메일형식이 아닙니다.";
    	public static final String NOT_INSERT_PASSWORD = "비밀번호가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_PASSWORD = "비밀번호는 4자이상 30자 이하만 가능합니다.";
    }
    
    public static class HotelSignup{
    	public static final String SUCCESS_HOTEL_UPDATE = "정보가 변경되었습니다.";
    	public static final String NOT_INSERT_HOTEL_NAME = "호텔명이 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HOTEL_NAME = "호텔명은 200자를 넘을 수 없습니다.";
    	public static final String NOT_INSERT_HOTEL_ADDRESS = "주소가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HOTEL_ADDRESS = "주소가 너무 짧거나 깁니다.(5~400자)";
    	public static final String NOT_INSERT_HOTEL_WEBSITE = "사이트 주소가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HOTEL_WEBSITE = "사이트 주소가 너무 짧거나 깁니다.(5~400자)";
    	public static final String NOT_INSERT_HOTEL_PHONE = "연락처가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HOTEL_PHONE = "연락처가 너무 짧거나 깁니다.(7~25자)";
    	public static final String NOT_INSERT_HOTEL_INFOMATION = "호텔정보가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HOTEL_INFOMATION = "호텔정보는 4000자를 넘을 수 없습니다.";
    	public static final String NOT_INSERT_HOTEL_LOCATION = "호텔 위치정보가 입력되지 않았습니다.";
    }
    
    public static class Hrm{
    	public static final String NOT_INSERT_HOTEL_INFORMATION= "호텔정보가 등록되지 않았습니다. 등록후 다시 시도해 주시기 바랍니다.";
    	public static final String SUCCESS_HRM_INSERT = "등록이 완료되었습니다.";
    	public static final String SUCCESS_HRM_UPDATE = "수정이 완료되었습니다.";
    	public static final String SUCCESS_HRM_DELETE = "삭제가 완료되었습니다.";
    	public static final String FAIL_HRM_UPDATE = "수정 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다.";
    	public static final String NOT_INSERT_HRM_NAME= "객실명이 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HRM_NAME = "객실명이 너무 길거나 짧습니다.(1~200자)";
    	public static final String NOT_INSERT_HRM_PERSONNEL_MAX = "최대인원이 입력되지 않았습니다.";
    	public static final String NOT_INSERT_HRM_ROOMNUM = "객실번호가 입력되지 않았습니다.";
    	public static final String NOT_INSERT_HRM_FEE = "금액이 입력되지 않았습니다.";
    	public static final String NOT_INSERT_HRM_CONFIGURATION = "객실구성이 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HRM_CONFIGURATION = "객실구성이 너무 길거나 짧습니다.(1~200자)";
    	public static final String NOT_INSERT_HRM_INFORMATION = "객실정보가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HRM_INFORMATION = "객실정보가 너무 길거나 짧습니다.(1~200자)";
    	public static final String NOT_INSERT_HRM_SERVICE = "제공서비스가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HRM_SERVICE = "제공서비스가 너무 길거나 짧습니다.(1~200자)";
    	public static final String NOT_INSERT_HRM_FEE_TYPE = "화폐타입이 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HRM_FEE_TYPE = "화폐타입은 1~10자까지 입력가능합니다.";
    	public static final String NOT_INSERT_HRM_KIND = "객실 종류가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_HRM_KIND = "객실 종류가 너무 길거나 짧습니다.(1~50자)";
    	public static final String NOT_INSERT_HRM_USE = "사용여부가 입력되지 않았습니다.";
    }
    
    public static class State {
		public static final String ROOM_VACANCY = "공실";
		public static final String CHECK_IN = "체크인";
		public static final String CHECK_OUT = "체크아웃";
		public static final String RESERVATION_START = "예약등록";
		public static final String RESERVATION_PROCEEDING = "예약중";
		public static final String ROOM_WAITING = "대기중";
		public static final String ROOM_DEPOSIT_WAIT = "입금대기";
		public static final String RESERVATION_SUCCESS = "예약완료";
		public static final String RESERVATION_CANCEL = "예약취소";
		public static final String RESERVATION_FINISH = "완료";
	}
    
    public static class HrmCheckMessage{
    	public static final String CHECK_IN_SUCCESS = "체크인이 완료되었습니다.";
    	public static final String CHECK_IN_FAIL = "체크인이 실패하였습니다.";
    	
    	public static final String CHECK_OUT_SUCCESS = "체크아웃이 완료되었습니다.";
    	public static final String CHECK_OUT_FAIL = "체크아웃에 실패하였습니다.";
    	
    	public static final String NOT_INSERT_CHECK_IN_HRM = "객실 정보가 입력되지 않았습니다.";
    	public static final String NOT_INSERT_CHECK_IN_RESERVATION = "예약 정보가 입력되지 않았습니다.";
    	public static final String NOT_INSERT_CHECK_IN_CUSTOMER = "예약자 정보가 입력되지 않았습니다.";
    	public static final String NOT_INSERT_CHECK_IN_GUESTNAME = "투숙자 정보가 입력되지 않았습니다.";
    	public static final String NOT_LENGTH_CHECK_IN_GUESTNAME = "투숙자 정보는 1~50자로 입력해야 합니다.";
    	
    	public static final boolean CHECKIN = true;
    	public static final boolean CHECKOUT = false;
    }
    
    public static class HrmImg{
    	public static final String SUCCESS_HRM_IMG_INSERT= "이미지가 등록되었습니다.";
    	public static final String SUCCESS_HRM_IMG_DELETE= "이미지가 삭제되었습니다.";
    	public static final String NOT_INSERT_HRM_SEQ = "객실번호가 입력되지 않았습니다.";
    	public static final String NOT_INSERT_HRM_IMG_FILE = "변경할 파일이 없습니다.";
    }
    
    public static class Customer{
    	public static final String SIGNUP_SUCCESS = "정상적으로 회원가입이 완료되었습니다.";
    	public static final String UPDATE_SUCCESS = "변경이 완료되었습니다.";
    	public static final String DELETE_SUCCESS = "탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.";
    	public static final String SIGNUP_FAIL = "회원가입에 실패하였습니다. 다시 회원가입 해주시기 바랍니다.";
    	public static final String INVALID_ID = "아이디가 입력되지 않았습니다.";
    	public static final String INVALID_LENGTH_ID = "아이디가 너무 짧거나 깁니다.(1~100자)";
    	public static final String INVALID_NAME= "이름이 입력되지 않았습니다.";
    	public static final String INVALID_LENGTH_NAME = "이름이 너무 짧거나 깁니다.(1~100자)";
    	public static final String INVALID_PASSWORD= "비밀번호가 입력되지 않았습니다.";
    	public static final String INVALID_LENGTH_PASSDORD = "비밀번호가이 너무 짧거나 깁니다.(8~30자)";
    	public static final String INVALID_PHONE = "연락처가 입력되지 않았습니다.";
    	public static final String INVALID_LENGTH_PHONE = "연락처가 너무 짧거나 깁니다.(5~20자)";
    	public static final String INVALID_EMAIL = "이메일이 입력되지 않았습니다.";
    	public static final String DUP_EMAIL = "이미 사용중인 이메일이거나 탈퇴한 이메일입니다.";
    	public static final String INVALID_MAIL = "잘못된 메일 형식 입니다.";
    	public static final String INVALID_LENGTH_MAIL = "메일이 너무 짧거나 깁니다.(8~100자)";
    	public static final String AVAILABLE_EMAIL = "사용 가능한 이메일 입니다.";
    	public static final String USER_PW_ERROR = "잘못된 비밀번호 입니다.";
    	public static final String LOGIN_SUCCESS = "HOTEL ClickToColl 에 오신 것을 환영합니다.";
    	public static final String LOGIN_FAIL = "아이디 혹은 비밀번호가 일치하지 않습니다.";
    }
    
    public static class Reservation{
    	public static final String RESERVATION_SUCCESS = "예약문의가 완료되었습니다.";
    	public static final String RESERVATION_FAIL = "예약문의에 실패하였습니다.";
    	public static final String ADD_RESERVATION_SUCCESS = "예약등록이 완료되었습니다.";
    	public static final String RESERVATION_UPDATE_SUCCESS = "문의정보가 수정되었습니다.";
    	public static final String RESERVATION_UPDATE_FAIL = "문의정보 수정에 실패하였습니다.";
    	public static final String INVALID_ROOM = "객실정보가 입력되지 않았습니다.";
    	public static final String INVALID_ROOM_COUNT = "객실수가 입력되지 않았습니다.";
    	public static final String INVALID_RESERVATION = "투숙객 고객명이 너무 짧거나 깁니다.(1~200자)";
    	public static final String INVALID_CUSTOMER = "투숙객 정보가 입력되지 않았습니다.";
    	public static final String INVALID_PERSONNEL = "인원이 입력되지 않았습니다.";
    	public static final String INVALID_TERM = "기간이 입력되지 않았습니다.";
    	public static final String INVALID_FIRST_DATE = "기간이 입력되지 않았습니다.";
    	public static final String INVALID_LAST_DATE = "기간이 입력되지 않았습니다.";
    	
    	public static final String HRM_RECOMMENDATION_SUCCESS = "객실추천이 완료되었습니다.";
    	public static final String HRM_RECOMMENDATION_FAIL = "객실추천에 실패하였습니다.";
    }
    
    public static class ReservationRegistration {
    	public static final String ADD_SUCCESS = "예약등록이 완료되었습니다.";
    	public static final String ADD_FAIL = "예약등록에 실패하였습니다.";
    	public static final String NOT_SELECTED = "예약일이 선택되지 않았습니다.";
    }
    
    public static class Search {
    	public static final String INVALID_LENGTH_VALUE="검색어가 너무 짧거나 깁니다.(1~50자)";
    	public static final String INVALID_VALUE="검색어가 입력되지 않았습니다.";
    	public static final String INVALID_TPYE="검색종류가 선택되지 않았습니다.";
    }
    
    public static class PeriodSearch {
    	public static final String INVALID_PERSONNEL="인원이 입력되지 않았습니다.";
    	public static final String INVALID_DATE_FUTURE="예약일은 현재보다 이전일 수 없습니다.";
    	public static final String INVALID_FIRSTDATE="예약 시작일이 입력되지 않았습니다.";
    	public static final String INVALID_LASTDATE="예약 종료일이 입력되지 않았습니다.";
    }
    
    public static class Pickdrop {
    	public static final String PICKDROP_ADD_SUCCESS = "픽드랍서비스가 등록 되었습니다.";
    	public static final String PICKDROP_FAIL = "픽드랍서비스 등록에 실패하였습니다.";
    	public static final String PICKDROP_DELETE_SUCCESS = "픽드랍서비스를 삭제하였습니다.";
    	public static final String PICKDROP_DELETE_FAIL = "픽드랍서비스 삭제에 실패하였습니다.";
    	public static final String PICKDROP_SUCCESS = "픽드랍서비스를 완료하였습니다.";
    	public static final String PICKDROP_SUCCESS_FAIL = "픽드랍서비스를 완료에 실패하였습니다.";
    	public static final String INVALID_HOTEL = "호텔 정보가 입력되지 않았습니다.";
    	public static final String INVALID_CUSTOMMER = "고객 정보가 입력되지 않았습니다.";
    	public static final String INVALID_PERSONNEL = "인원 정보가 입력되지 않았습니다.";
    	public static final String INVALID_DATE = "요청시간 정보가 입력되지 않았습니다.";
    	public static final String INVALID_DATE_FUTURE = "요청시간은 현재보다 과거일 수 없습니다.";
    	public static final String INVALID_STARTPOINT = "출발지 정보가 입력되지 않았습니다.";
    	public static final String INVALID_ENDPOINT = "도착지 정보가 입력되지 않았습니다.";
    }
    
    public static class Group{
    	public static String SUCCESS_CREATE = "그룹 생성에 성공하였습니다.";
    	public static String FAIL_CREATE = "그룹 생성 시 오류가 발생하였습니다.";
    	public static String ERROR_PW = "비밀번호가 일치 하지 않습니다. 다시 과정을 진행해 주시기 바랍니다.";
    }
    
    public static class Persion{
    	public static String PERSION_INFO_SECCESS = "그룹 생성에 성공하였습니다.";
    	public static String PERSION_INFO_FAIL = "그룹 생성 시 오류가 발생하였습니다.";
    	public static String PERSION_INFO_ERROR = "비밀번호가 일치 하지 않습니다. 다시 과정을 진행해 주시기 바랍니다.";
    	public static String PERSION_INFO_DONTCHANGE = "DONTCHANGE";
    }
}