package cn.com.comit.appointment.modules.wechat.utils;

import java.io.InputStream;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.List;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPHeaderElement;

import org.apache.axis.client.Call;  
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

import cn.com.comit.appointment.common.utils.DateUtils;
import cn.com.comit.appointment.modules.wechat.test.msg.DESEncryption;

/**
 * 发送短信
 * @author ChenXiHua
 * @version 2018-11-9
 *
 */
public class SendSMsgUtil {

	public static void sendMessage(String phone,String code) {
		String result="";
	    String url = "http://192.168.0.68:1126/NoticeCenterService.asmx";  
	    String namespace = "http://comit.com.cn/";  
	    String methodName = "SendSmsRealTime";  
	    String soapActionURI = "http://comit.com.cn/SendSmsRealTime";  
	    Service service = new Service();  
	    Call call;  
	    try {  
	        call = (Call) service.createCall();  
	        call.setTargetEndpointAddress(url);  
	        call.setUseSOAPAction(true);  
	        call.setSOAPActionURI(soapActionURI);  
	        call.setOperationName(new QName(namespace, methodName));  
	        call.addParameter(new QName(namespace, "a"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "b"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "c"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "d"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "e"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "f"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "g"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.addParameter(new QName(namespace, "h"), XMLType.XSD_STRING,ParameterMode.IN);
	        call.setReturnType(XMLType.XSD_STRING);  
	        //对传入的参数进行赋值操作
	        String key=DESEncryption.toHexString(DESEncryption.encrypt(DateUtils.formatDateTime(new Date()),"tesecret"));
	        System.out.println("key-->"+key);
	        String[] str = new String[8];  
	        str[0] =phone; //手机号码
	        str[1] =code;  //发送内容
	        str[2] ="12";  //发送人ID
	        str[3]="1";//发送人名称,utf8编码
	        str[4]="2";//发送组织
	        str[5]="3";//手机用户名称
	        str[6]=key;//加密字符串
	        str[7]="123";//案件编号
	        //开始调用服务
	         result = (String) call.invoke(str);  
	        System.out.println("result is-->"+result);  //对返回参数进行输出
	    } catch (ServiceException e) {  
	        e.printStackTrace();  
		}catch(RemoteException e){
			e.printStackTrace(); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		}
		
		public static void sendMessage(String[] str,String ip) {
			String result="";
			String serviceUrl="";
		   // String url = "http://192.168.0.68:1126/NoticeCenterService.asmx";  
			if (ip.indexOf("192.168") > -1 || ip.indexOf("localhost") > -1 )
			{
				serviceUrl = "http://192.168.0.224:1126";
			}
			else
			{
				serviceUrl = "http://10.0.67.200:9003";
			}
			//短信接口
			String url = serviceUrl + "/NoticeCenterService.asmx";
			System.out.println("url--->"+url);
		    String namespace = "http://comit.com.cn/";  
		    String methodName = "SendSmsRealTime";  
		    String soapActionURI = "http://comit.com.cn/SendSmsRealTime";  
		    Service service = new Service();  
		    Call call;  
		    try {  
		        call = (Call) service.createCall();  
		        call.setTargetEndpointAddress(url);  
		        call.setUseSOAPAction(true);  
		        call.setSOAPActionURI(soapActionURI);  
		        call.setOperationName(new QName(namespace, methodName));  
		        call.addParameter(new QName(namespace, "a"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "b"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "c"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "d"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "e"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "f"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "g"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.addParameter(new QName(namespace, "h"), XMLType.XSD_STRING,ParameterMode.IN);
		        call.setReturnType(XMLType.XSD_STRING);  
		        //对传入的参数进行赋值操作
		        String key=DESEncryption.toHexString(DESEncryption.encrypt(DateUtils.formatDateTime(new Date()),"tesecret"));
		        System.out.println("key-->"+key);
		        //开始调用服务
		         result = (String) call.invoke(str);  
		        System.out.println("result is-->"+result);  //对返回参数进行输出
		    } catch (ServiceException e) {  
		        e.printStackTrace();  
			}catch(RemoteException e){
				e.printStackTrace(); 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
			}
		
		//封装短信参数
		public static void sendParams(String phone,String content,String ip){
			try {
			System.out.println("sendParams-->"+phone+"--->code-->"+content);
			String[] str = new String[8];  
			  str[0] =phone; //手机号码
		      str[1] =content;  //发送内容
		      //str[1]="正在核实您的用户信息，您的验证码是：228096，验证码5分钟内有效，如非本人操作请忽略";
		      str[2] ="12";  //发送人ID
		      str[3]="1";//发送人名称,utf8编码
		      str[4]="2";//发送组织
		      str[5]="3";//手机用户名称
		      String key;
			  key = DESEncryption.toHexString(DESEncryption.encrypt(DateUtils.formatDateTime(new Date()),"tesecret"));
			  str[6]=key;
			  str[7]="123";//案件编号
			  sendMessage(str,ip);
			} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	
	 /* public static void main(String[] args){
		  String content="正在核实您的用户信息，您的验证码是：228096，验证码5分钟内有效，如非本人操作请忽略";
		  sendParams("18206682515",content,"localhost");
	}*/

}
