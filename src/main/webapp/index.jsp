<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>와이파이 정보 구하기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="location.js"></script>
</head>
<body>
    <h1>와이파이 정보 구하기</h1>
    <div>
        <ul class="nav justify-content-start bg-light float-left">
            <a class="nav-link" href="index.jsp">홈</a> |
            <a class="nav-link" href="history.jsp">위치 히스토리 목록</a> |
            <a class="nav-link" href="load-wifi.jsp">와이파이 정보 가져오기</a>
        </ul>
    </div>
    <br/>

    <form method="get" action="/load.jsp">
        LAT : <input type="text" id="location_lat" name="lat" value/>
        LNT : <input type="text" id="location_lnt" name="lnt" value/>
        <input type="button", value="내 위치 가져오기" onclick="on()"/>
        <input type="submit", value="근처 Wi-Fi 정보 보기"/>
    </form>

    <table class="table table-bordered">
        <thead>
        <th scope="col" class="text-center">거리</th>
        <th scope="col" class="text-center">관리번호</th>
        <th scope="col" class="text-center">자치구</th>
        <th scope="col" class="text-center">와이파이명</th>
        <th scope="col" class="text-center">도로명주소</th>
        <th scope="col" class="text-center">상세주소</th>
        <th scope="col" class="text-center">설치위치</th>
        <th scope="col" class="text-center">설치기관</th>
        <th scope="col" class="text-center">서비스구분</th>
        <th scope="col" class="text-center">망종류</th>
        <th scope="col" class="text-center"> 설치년도</th>
        <th scope="col" class="text-center">실내외구분</th>
        <th scope="col" class="text-center">Wifi접속환경</th>
        <th scope="col" class="text-center">Y좌표</th>
        <th scope="col" class="text-center">X좌표</th>
        <th scope="col" class="text-center">작업일자</th>
        </thead>
        <tbody>
            <tr>
                <td colspan="16" class="text-center">위치 정보를 입력한 후에 조회해주세요</td>
            </tr>
        </tbody>
    </table>

</h1>
<br/>
</body>
</html>