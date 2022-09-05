package com.admiralxy.cinema.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailPreparationException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Service
public class MailSender {

    private final JavaMailSender mailSender;
    private final Map<String, MailGenerator> map;

    @Value("${spring.application.domain}")
    private String applicationDomain;

    @Value("${spring.application.name}")
    private String applicationName;

    @Value("${spring.mail.username}")
    private String emailFrom;

    @Autowired
    public MailSender(JavaMailSender mailSender, Map<String, MailGenerator> map) {
        this.mailSender = mailSender;
        this.map = map;
    }

    public void send(MailInfo info) {
        String code = info.getTemplateCode();
        MailGenerator mailGenerator = map.get(code);

        if (mailGenerator == null)
            throw new UnsupportedOperationException(code + " not supported yet.");

        info.getProps().put("applicationDomain", applicationDomain);
        String html = mailGenerator.generate(info);
        sendMail(info, html);
    }

    private void sendMail(MailInfo info, String html) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());
            helper.setFrom(emailFrom);
            helper.setTo(info.getEmailTo());
            helper.setSubject(applicationName + " - " + info.getSubject());
            helper.setText(html, true);
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            throw new MailPreparationException("Error while construct e-mail body");
        }
    }

}
