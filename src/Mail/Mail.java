/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author L
 */
public class Mail {
    private static final Properties props = System.getProperties();
    private static String HOST = "smtp.gmail.com", PORT = "25", USER = "youssef.bekrine@gmail.com", PASS = "pass", TLS = "true", AUTH = "true";
    private String _from, _to, _message, _subject;
    private final Map<String, String> _property = new HashMap<String, String>();

    public Mail(String _from, String _to, String _message,String _subject) {
        props.put("mail.smtp.starttls.enable", TLS);
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.user", USER);
        props.put("mail.smtp.password", PASS);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.auth", AUTH);
        this._subject=_subject;
        this._from = _from;
        this._to = _to;
        this._message = _message;
    }

    public boolean send() {
        try {
            String[] to = {_to};
            Session session = Session.getDefaultInstance(props, null);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(_from));
            InternetAddress[] toAddress = new InternetAddress[to.length];
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }
            for (InternetAddress toAddres : toAddress) {
                message.addRecipient(Message.RecipientType.TO, toAddres);
            }
            message.setSubject(_subject);
            message.setContent(_message, "text/html");
            Transport transport = session.getTransport("smtp");
            transport.connect(HOST, USER, PASS);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return true;
        } catch (MessagingException ex) {
        	ex.printStackTrace();
            return false;
        }
    }

    public String getFrom() {
        return _from;
    }

    public void setFrom(String _from) {
        this._from = _from;
    }

    public String getTo() {
        return _to;
    }

    public void setTo(String _to) {
        this._to = _to;
    }

    public String getMessage() {
        return _message;
    }

    public void setMessage(String _message) {
        this._message = _message;
    }

    public String getSubject() {
        return _subject;
    }

    public void setSubject(String _subject) {
        this._subject = _subject;
    }

    public String getProperty(String _prop) {
        return _property.get(_prop);
    }

    public void setProperty(String _prop, String _value) {
        _property.put(_prop, _value);
    }

    public static String getHOST() {
        return HOST;
    }

    public static void setHOST(String HOST) {
        Mail.HOST = HOST;
    }

    public static String getPORT() {
        return PORT;
    }

    public static void setPORT(String PORT) {
        Mail.PORT = PORT;
    }

    public static String getUSER() {
        return USER;
    }

    public static void setUSER(String USER) {
        Mail.USER = USER;
    }

    public static String getPASS() {
        return PASS;
    }

    public static void setPASS(String PASS) {
        Mail.PASS = PASS;
    }

    public static String getTLS() {
        return TLS;
    }

    public static void setTLS(String TLS) {
        Mail.TLS = TLS;
    }

    public static String getAUTH() {
        return AUTH;
    }

    public static void setAUTH(String AUTH) {
        Mail.AUTH = AUTH;
    }
}
