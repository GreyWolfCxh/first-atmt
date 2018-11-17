package cn.com.comit.appointment.modules.sys.service;


/**
 * 消息队列服务接口
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
public interface RabbitProductorService {
    /**
     * 发送消息到指定队列
     * @param queueKey
     * @param object
     */
    public void sendMessage(String queueKey, Object object);
}
