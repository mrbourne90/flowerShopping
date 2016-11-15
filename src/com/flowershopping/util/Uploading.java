package com.flowershopping.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 * 用于将文件保存在本地系统
 * @author mrbourne
 *
 */
public class Uploading {

	public static void upload(File file, String fileName) {

		// 使用commons-io提供的工具
		// File newFile = new File(fileName);
		// try {
		// FileUtils.copyFile(file, newFile);
		// } catch (IOException e) {
		// e.printStackTrace();
		// }

		// 使用传统IO
		// File file2 = new File(fileName);
		// try {
		// InputStream is = new FileInputStream(file);
		// OutputStream os = new FileOutputStream(file2);
		// byte buffer[] = new byte[1024];
		// int count = 0;
		// while ((count = is.read(buffer)) != -1) {
		// os.write(buffer, 0, count);
		// }
		// os.close();
		// is.close();
		// } catch (IOException e) {
		// e.printStackTrace();
		// }

		// 使用NIO
		File newFile = new File(fileName);
		try {
			FileInputStream fis = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream(newFile);
			// 读
			FileChannel readChannel = fis.getChannel();
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ByteBuffer buffer = ByteBuffer.allocate(1024);
			@SuppressWarnings("unused")
			int result = 0;
			while ((result = readChannel.read(buffer)) != -1) {
				buffer.flip();
				bos.write(buffer.array(), 0, buffer.remaining());
				buffer.clear();
			}
			// 写
			FileChannel writeChannel = fos.getChannel();
			writeChannel.write(ByteBuffer.wrap(bos.toByteArray()));
			fis.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
