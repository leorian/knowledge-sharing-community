package com.ruoyi.common.utils;

import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Shape;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * 二维码工具类
 *
 * @version 1.0
 * @date 2018年7月10日
 */
public class QRCodeUtils {
    private static Logger logger = LoggerFactory.getLogger(QRCodeUtils.class);

    // 二维码大小
    private static final int QRCODE_SIZE = 300;

    // 二维码中间logo的尺寸
    private static final int WIDTH = 60;
    private static final int HEIGHT = 60;

    public static void encode(String content, String logoPath, String imgPath) throws Exception {
        encode(content, logoPath, imgPath, QRCODE_SIZE, 1);
    }

    public static void encode(String content, String logoPath, String imgPath, int size, int margin) throws Exception {
        BufferedImage image = createImage(content, logoPath, size, margin);
        ImageIO.write(image, "png", new File(imgPath));
    }

    public static void encode(String content, String logoPath, OutputStream output) throws Exception {
        encode(content, logoPath, output, QRCODE_SIZE, 1);
    }

    public static void encode(String content, String logoPath, OutputStream output, int size, int margin) throws Exception {
        BufferedImage image = createImage(content, logoPath, size, margin);
        ImageIO.write(image, "png", output);
    }

    private static BufferedImage createImage(String content, String imgPath, int size, int margin) throws Exception {
        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        hints.put(EncodeHintType.MARGIN, margin);
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, size, size, hints);

        int[] rec = bitMatrix.getEnclosingRectangle();
        int resWidth = rec[2] + 1;
        int resHeight = rec[3] + 1;
        BitMatrix resMatrix = new BitMatrix(resWidth, resHeight);
        resMatrix.clear();
        for (int i = 0; i < resWidth; i++) {
            for (int j = 0; j < resHeight; j++) {
                if (bitMatrix.get(i + rec[0], j + rec[1])) {
                    resMatrix.set(i, j);
                }
            }
        }

        int width = bitMatrix.getWidth();
        int height = bitMatrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
            }
        }
        if (imgPath == null || "".equals(imgPath)) {
            return image;
        }
        // 插入图片
        insertImage(image, imgPath, size);
        return image;
    }

    private static void insertImage(BufferedImage source, String imgPath, int size) throws Exception {
        File file = new File(imgPath);
        if (!file.exists()) {
            logger.error("" + imgPath + "   该文件不存在！");
            return;
        }
        Image src = ImageIO.read(new File(imgPath));
        int width = src.getWidth(null);
        int height = src.getHeight(null);
        // 压缩LOGO
        if (width > WIDTH) {
            width = WIDTH;
        }
        if (height > HEIGHT) {
            height = HEIGHT;
        }
        Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = tag.getGraphics();
        g.drawImage(image, 0, 0, null); // 绘制缩小后的图
        g.dispose();
        src = image;
        // 插入LOGO
        Graphics2D graph = source.createGraphics();
        int x = (size - width) / 2;
        int y = (size - height) / 2;
        graph.drawImage(src, x, y, width, height, null);
        Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);
        graph.setStroke(new BasicStroke(3f));
        graph.draw(shape);
        graph.dispose();
    }

    public static String decode(File file) throws Exception {
        BufferedImage image;
        image = ImageIO.read(file);
        if (image == null) {
            return null;
        }
        BufferedImageLuminanceSource source = new BufferedImageLuminanceSource(image);
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
        Result result;
        Hashtable<DecodeHintType, Object> hints = new Hashtable<DecodeHintType, Object>();
        hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");
        result = new MultiFormatReader().decode(bitmap, hints);
        return result != null ? result.getText() : null;
    }

    public static void main(String[] args) throws Exception {
        // 生成带logo的二维码，不需要带logo不传参数即可
        QRCodeUtils.encode("https://raw.githubusercontent.com/leorian/android_app/master/douban/fanyule-app-release.apk", "C:\\test\\yule.jpg", "c:/test/douban_movie.png");
        QRCodeUtils.encode("https://raw.githubusercontent.com/leorian/android_app/master/navigation/navigation-app-release.apk", "C:\\test\\dragon.jpg", "c:/test/dragon_navigation.png");

        // 解析二维码存储的内容并打印
        System.out.println(decode(new File("c:/test/douban_movie.png")));
        System.out.println(decode(new File("c:/test/dragon_navigation.png")));
    }
}
