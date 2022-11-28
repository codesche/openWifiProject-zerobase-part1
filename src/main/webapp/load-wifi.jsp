
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DataBase.DBConnection" %>
<%@ page import="DataBase.LoadWifi" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DataBase.WifiDTO" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<%
    Connection conn = DBConnection.getConnection();

    // History Table 생성
    final String CREATE_History = "CREATE TABLE IF NOT EXISTS History"
            + "("
            + " ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,"
            + " LAT DOUBLE NOT NULL,"
            + " LNT DOUBLE NOT NULL,"
            + " LOADDATE VARCHAR(255) NOT NULL"
            + ")";

    // WiFi 테이블 생성
    final String SqlCreate = "CREATE TABLE IF NOT EXISTS WiFi"
            + "("
            + " controlNum VARCHAR(255) NOT NULL, "
            + " borough VARCHAR(255) NOT NULL, "
            + " wifiName VARCHAR(255) NOT NULL, "
            + " roadAddress VARCHAR(255) NOT NULL, "
            + " detailAddress VARCHAR(255), "
            + " installLocation VARCHAR(255), "
            + " installType VARCHAR(255) NOT NULL, "
            + " installOrg VARCHAR(255) NOT NULL, "
            + " serviceType VARCHAR(255) NOT NULL, "
            + " webType VARCHAR(255) NOT NULL, "
            + " installYear VARCHAR(255) NOT NULL, "
            + " inAndOut VARCHAR(255) NOT NULL, "
            + " wifiProp VARCHAR(255), "
            + " LAT DOUBLE NOT NULL, "
            + " LNT DOUBLE NOT NULL, "
            + " workDate VARCHAR(255) NOT NULL "
            + ")";

    final String SqlInsert = "INSERT INTO WiFi VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    final String SqlDrop = "Drop Table IF EXISTS WiFi";

    ArrayList<WifiDTO> wifi = null;
    LoadWifi loadwifi = new LoadWifi();
    PreparedStatement ps;
    Statement sm;

    try {
        sm = conn.createStatement();
        sm.execute(SqlDrop);

        sm = conn.createStatement();
        sm.execute(CREATE_History);

        sm = conn.createStatement();
        sm.execute(SqlCreate);

        ps = conn.prepareStatement(SqlInsert);

        wifi = loadwifi.getWifiInfo();

        for (int i = 0; i < wifi.size(); i++) {
            ps.setString(1, wifi.get(i).getX_SWIFI_MGR_NO());
            ps.setString(2, wifi.get(i).getX_SWIFI_WRDOFC());
            ps.setString(3, wifi.get(i).getX_SWIFI_MAIN_NM());
            ps.setString(4, wifi.get(i).getX_SWIFI_ADRES1());
            ps.setString(5, wifi.get(i).getX_SWIFI_ADRES2());
            ps.setString(6, wifi.get(i).getX_SWIFI_INSTL_FLOOR());
            ps.setString(7, wifi.get(i).getX_SWIFI_INSTL_TY());
            ps.setString(8, wifi.get(i).getX_SWIFI_INSTL_MBY());
            ps.setString(9, wifi.get(i).getX_SWIFI_SVC_SE());
            ps.setString(10, wifi.get(i).getX_SWIFI_CMCWR());
            ps.setString(11, wifi.get(i).getX_SWIFI_CNSTC_YEAR());
            ps.setString(12, wifi.get(i).getX_SWIFI_INOUT_DOOR());
            ps.setString(13, wifi.get(i).getX_SWIFI_REMARS3());
            ps.setDouble(14, wifi.get(i).getLAT());
            ps.setDouble(15, wifi.get(i).getLNT());
            ps.setString(16, wifi.get(i).getWORK_DTTM());

            ps.execute();

            System.out.println(i + "th processing");
        }
        sm.close();
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Connection closed");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

<html>
<head>
    <title>작업 완료</title>
</head>
<body>
    <H3 align="center"><%=wifi.size()%>개의 Wifi정보를 정상적으로 저장하였습니다.</H3>
    <H3 align="center"><a href="index.jsp">홈으로 가기</a></H3>
</body>
</html>
