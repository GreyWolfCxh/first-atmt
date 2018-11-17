package cn.com.comit.appointment.modules.test.cs;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

public class MessageConsumer2 implements MessageListener {

	@Override
	public void onMessage(Message message) {
		System.out.println("consumer-->"+message);
		
	}

}
