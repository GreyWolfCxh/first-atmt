package cn.com.comit.appointment.modules.test.cs;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.stereotype.Service;


@Service("MessageProducer2")
public class MessageProducer2 {
	
	@Resource(name="amqpTemplate")
	private AmqpTemplate  amqpTemplate;
	
	public void sendMessage(Object message)throws IOException{
		amqpTemplate.convertAndSend("queueTestKey",message);
	}
	
	

}
