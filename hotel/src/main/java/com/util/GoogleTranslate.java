package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

/**
 *
 * @author Ravishanker Kusuma
 */
public class GoogleTranslate {

	private static String key;
	private static GoogleTranslate translator = new GoogleTranslate("AIzaSyAGdiMje9nYkXVuM7cKYdBVFXVMTCY0Mlo");
	
	public GoogleTranslate(String apiKey) {
		key = apiKey;
	}

	public static String translte(String text, String from, String to) {
		StringBuilder result = new StringBuilder();
		String translatedText = "";
		
		try {
			String encodedText = text; //URLEncoder.encode(text, "UTF-8");
			String urlStr = "https://translation.googleapis.com/language/translate/v2?" +
					"q=" + text +
					"&target=" + to + 
					"&source=" + from + 
					"&key=" + key + 
					"&model=nmt";
			System.out.println("urlStr==="+ urlStr);
			
			
			String urlStr2 = "https://translation.googleapis.com/language/translate/v2?" +
				"q=안녕" +
				"&source=ko" +
				"&target=en" +
				"&key=AIzaSyAGdiMje9nYkXVuM7cKYdBVFXVMTCY0Mlo" +
				"&model=nmt";
	
			/*String str_kr = "한글";
			String charset[] = { "euc-kr", "ksc5601", "iso-8859-1", "8859_1", "ascii", "UTF-8" };
			for (int i = 0; i < charset.length; i++) {
				System.out.println(charset[i] + " URLEncoder : " + URLEncoder.encode(str_kr, charset[i]));
				System.out.println(charset[i] + " URLDecoder : " + URLDecoder.decode(str_kr, charset[i]));
			}
				*/
				
			URL url = new URL(urlStr);

			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			InputStream stream;
			if (conn.getResponseCode() == 200) // success
			{
				stream = conn.getInputStream();
			} else
				stream = conn.getErrorStream();

			BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
			String line;
			while ((line = reader.readLine()) != null) {
				result.append(line);
//				System.out.println("1====="+ result.append(line));
			}

			JsonParser parser = new JsonParser();

			JsonElement element = parser.parse(result.toString());
			if (element.isJsonObject()) {
				JsonObject obj = element.getAsJsonObject();
				if (obj.get("error") == null) {
					translatedText = obj.get("data").getAsJsonObject().get("translations").getAsJsonArray()
							.get(0).getAsJsonObject().get("translatedText").getAsString();

				}
			}else if (conn.getResponseCode() != 200) {
				System.err.println(result);
				translatedText = "error : 200";
			}

		} catch (IOException | JsonSyntaxException ex) {
			System.err.println(ex.getMessage());
		}

		return translatedText;
	}

//	public static void main(String[] args) {
//
//		
//		String text = translator.translte("안녕", "ko", "en");
//		System.out.println(text);
//	}
}