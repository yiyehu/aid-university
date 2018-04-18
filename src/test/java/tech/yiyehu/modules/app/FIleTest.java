package tech.yiyehu.modules.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import tech.yiyehu.modules.app.controller.GoodsImagesController;


@RunWith(SpringRunner.class)
@SpringBootTest
public class FIleTest {

    @Test
    public void test() {
    	String filePath = GoodsImagesController.class.getResource("/").getPath();
    	String localPath = filePath+"/sdfsesdfsdfe.png";
        System.out.println(localPath);
    }

}
