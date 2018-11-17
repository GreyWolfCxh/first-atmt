package cn.com.comit.appointment.modules.test.rabbitmq;


import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.beans.factory.annotation.Autowired;


import cn.com.comit.appointment.modules.sys.dao.LogsMapper;
import cn.com.comit.appointment.modules.sys.entity.Logs;

public class MessageConsumer implements MessageListener {
     private Logger logger = LoggerFactory.getLogger(MessageConsumer.class); 
     
     @Autowired
     private LogsMapper logsMapper;
     
    @Override
    public void onMessage(Message message) {
    	  try {
			String messages = new String(message.getBody(), "UTF-8");
			String[] str=messages.split(",");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Logs log=new Logs();
/*			log.setNAME(str[0]);
			log.setTIME(str[1]);
			log.setACTION(str[2]);
*/			System.out.println("log-->"+log.toString());
			logsMapper.insertSelective(log);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         logger.info("consumer receive message------->:{}", message);  
    }

}