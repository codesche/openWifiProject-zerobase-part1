
![header](https://capsule-render.vercel.app/api?type=waving&color=auto&height=300&section=header&text=Open-Wifi%20Project&fontSize=60)

<h1>내 위치 기반 공공 와이파이 정보를 제공하는 웹서비스</h1>

## 프로젝트 수행 목적 ##
* **자바, JSP(Servlet), 데이터베이스 등 다양한 언어와 스킬을 활용한 웹서비스 개발**

## 프로젝트 기간 ##
**2022.11.21 ~ 2022.11.28**

<h3>📚 Main Language With Application 📚</h3>
<p>
  <img src="https://img.shields.io/badge/Java-3366FF?style=flat-square&logo=Java&logoColor=white"/></a>&nbsp
  <img src="https://img.shields.io/badge/JSP-FF5200?style=flat-square&logo=JSP&logoColor=white"/></a>&nbsp
</p>

<h3>📚 DBMS 📚</h3>
  <img src="https://img.shields.io/badge/Sqlite-003B57?style=flat-square&logo=Sqlite&logoColor=white"/></a>
<p>

<h3>📚 Application Server 📚</h3>
<p>
  <img src="https://img.shields.io/badge/Apache Tomcat 8.5-FBDC75?style=flat-square&logo=Apache Tomcat&logoColor=black"/></a>&nbsp
</p>

<h3>📚 Web Language 📚</h3>
<p>
  <img src="https://img.shields.io/badge/HTML5-FF0000?style=flat-square&logo=HTML5&logoColor=white"/></a>&nbsp
  <img src="https://img.shields.io/badge/CSS-0066FF?style=flat-square&logo=css3&logoColor=white"/></a>&nbsp
  <img src="https://img.shields.io/badge/Javascript-FFFF33?style=flat-square&logo=javascript&logoColor=white"/></a>
</p>

<h3>📚 기타(Framework + Library) 📚</h3>
<p>
  <img src="https://img.shields.io/badge/JSON-000000?style=flat-square&logo=JSON&logoColor=white"/></a>&nbsp
  <img src="https://img.shields.io/badge/JQuery-0769AD?style=flat-square&logo=Jquery&logoColor=white"/></a>&nbsp
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"/></a>&nbsp
</p>

## 개발 환경 ##
* **Language : Java, HTML, CSS, JavaScript**
* **DBMS : Sqlite**
* **JDK : JDK 1.8**
* **Server : Apache Tomcat 8.5.83**
* **Library : okhttp3, gson, lombok, sqlite-jdbc, jquery**
* **IDE: Intellij IDEA 2022.2.3 (Ultimate Edition)**

## 주요 파일 구성 ##
* DeleteServlet : 히스토리 삭제 기능 처리
* DBConnection : sqlite DB 연동
* LoadWifi : 서울시 공공 Wifi정보 불러오는 로직 구성
+ WifiDTO : 서울시 공공 Wifi정보 Load시 필요한 테이블 정보 구성(Data Transfer Object)
  - 유저가 자신의 브라우저에서 데이터를 입력하여 form에 있는 데이터를 DTO에 넣어서 전송
  - 해당 DTO를 받은 서버가 DAO를 이용하여 데이터베이스로 데이터를 집어넣음
* history.jsp : 위치 히스토리 목록 화면 View 기능 및 목록 조회
* load.jsp : 히스토리 정보 Insert + 거리 정보 Insert + Select시 조건 충족시키는 데이터 20개 미만 조회
* load-wifi.jsp : LoadWifi에서 불러온 서울시 공공와이파이 정보를 WiFi테이블에 Insert시킴
* noValueError.jsp : 위도값, 경도값 미입력시 예외처리
* location.js : 현재 위치 출력 + 현재 위치 탐색 + 에러 처리 함수

## ERD ##
![project1-erd](https://user-images.githubusercontent.com/110509654/204237094-61fe947d-7954-4da9-a9da-a74f87baf7b5.PNG)

