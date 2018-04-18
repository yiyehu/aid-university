package tech.yiyehu.modules.oss.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * 
 * @author zhuangyuan
 *
 */
public class FileUtils {
	public static final String resoucePath = FileUtils.class.getResource("/").getPath();
	public static String getlocalFilePath() {
		return FileUtils.class.getResource("").toString();
	}

	public static String getFileName(String path) {

		path = path.substring(path.lastIndexOf("/") + 1, path.length());
		return path;
	}

	public static boolean fileWriter(String localPath, byte[] bytes) throws IOException {
		File localPathFile = new File(localPath);
		FileOutputStream outStream = new FileOutputStream(localPathFile);
		// 写入数据
		outStream.write(bytes);
		// 关闭输出流
		outStream.close();
		return true;
	}
}
