package cn.com.comit.appointment.modules.sys.service.impl;


import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.modules.sys.service.RabbitProductorService;
 
@Service("RabbitProductorServiceImpl")
public class RabbitProductorServiceImpl implements RabbitProductorService{
 
    @Autowired
    private AmqpTemplate amqpTemplate;
 
    @Override
    public void sendMessage(String routeKey, Object message) {
        try {
        	
        	System.out.println("cs------"+routeKey);
        	System.out.println("cs------"+message);
            amqpTemplate.convertAndSend(routeKey,message);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
 
}

