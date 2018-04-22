/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package tech.yiyehu.modules.oss.cloud;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.List;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.DeleteObjectsRequest;
import com.aliyun.oss.model.DeleteObjectsResult;
import com.aliyun.oss.model.GetObjectRequest;

import tech.yiyehu.common.exception.RRException;

/**
 * 阿里云存储
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-26 16:22
 * 
 * @author yiyehu
 * @email zhuangyuan_k@gmail.com
 * @date 2018-04-12 10:09
 */

public class AliyunCloudStorageService extends CloudStorageService {
    private OSSClient client;

    public AliyunCloudStorageService(CloudStorageConfig config){
        this.config = config;

        //初始化
        init();
    }

    private void init(){
        client = new OSSClient(config.getAliyunEndPoint(), config.getAliyunAccessKeyId(),
                config.getAliyunAccessKeySecret());
    }

    @Override
	public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        try {
            client.putObject(config.getAliyunBucketName(), path, inputStream);
        } catch (Exception e){
            throw new RRException("上传文件失败，请检查配置信息", e);
        }

        return path;
    }

    @Override
    public String uploadSuffix(byte[] data, String suffix) {
        return upload(data, getPath(config.getAliyunPrefix(), suffix));
    }

    @Override
    public String uploadSuffix(InputStream inputStream, String suffix) {
        return upload(inputStream, getPath(config.getAliyunPrefix(), suffix));
    }
    
    /**
     * 文件下载
     * @param key         云存储key
     * @param localPath   存储的本地路径
     * @return            Boolean
     */
    @Override
	public boolean download(String key,String localPath) {
		File localFile = new File(localPath);
		if(!localFile.exists()) {
			try {

				client.getObject(new GetObjectRequest(config.getAliyunBucketName(), key),localFile);
			}
			catch(Exception e) {
				return true;
			}
			return true;
		}
		return false;
	}
	
	/**
     * 文件删除
     * @param key         路径
     * @return            本地文件路径
     */
	public void deleteObject(String key) {
		
		client.deleteObject(config.getAliyunBucketName(), key);
	}
	
	/**
     * 文件删除
     * @param key         路径
     * @return            本地文件路径
     */
	public DeleteObjectsResult deleteObjects(List<String> keys) {
		DeleteObjectsRequest deleteObjectsRequest = new DeleteObjectsRequest(config.getAliyunBucketName());
		deleteObjectsRequest.setKeys(keys);
		DeleteObjectsResult result = client.deleteObjects(deleteObjectsRequest);
		
		return result;
	}
	
}
