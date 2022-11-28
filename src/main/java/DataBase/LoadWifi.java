package DataBase;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

public class LoadWifi {
    static BufferedReader br;
    static HttpURLConnection conn;
    static ArrayList<WifiDTO> wifiInfo;
    static JsonObject TbPublicWifiInfo;
    static JsonParser parser;
    static JsonObject object;
    static JsonArray row;

    public ArrayList<WifiDTO> getWifiInfo() throws IOException {
        int cnt = 0;
        String line = "";
        wifiInfo = new ArrayList<>();
        for (int i = 0; i < 18; i++) {
            StringBuilder sb_url = new StringBuilder("http://openapi.seoul.go.kr:8088/7056646148686d7339396953756771/json/TbPublicWifiInfo");

            sb_url.append("/" + URLEncoder.encode(String.valueOf(cnt = cnt + 1), "UTF-8"));
            sb_url.append("/" + URLEncoder.encode(String.valueOf(cnt = cnt + 999), "UTF-8"));

            URL url = new URL(sb_url.toString());
            System.out.println(sb_url);

            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/xml");

            // 연결 확인
            System.out.println("Response code: " + conn.getResponseCode());

            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                br = new BufferedReader(new InputStreamReader
                        (conn.getInputStream() ,"UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader
                        (conn.getErrorStream(),"UTF-8"));
            }

            StringBuilder sb = new StringBuilder();

            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            parser = new JsonParser();
            object = (JsonObject) parser.parse(sb.toString());
            TbPublicWifiInfo = (JsonObject) object.get("TbPublicWifiInfo");
            row = (JsonArray) TbPublicWifiInfo.get("row");

            Gson gson = new Gson();
            for (int j = 0; j < row.size(); j++) {
                JsonObject temp = (JsonObject) row.get(j);
                WifiDTO wifiDto = gson.fromJson(temp.toString(), WifiDTO.class);

                if (wifiDto != null) {
                    wifiInfo.add(wifiDto);
                }
            }
        }
        br.close();
        conn.disconnect();

        return wifiInfo;
    }

}
