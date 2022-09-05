package com.admiralxy.cinema.mail;

import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

@Component("activate")
public class ActivateMailGenerator extends MailGenerator {

    @Autowired
    public ActivateMailGenerator(FreeMarkerConfigurer freemarkerConfigurer) {
        super(freemarkerConfigurer);
    }

    @Override
    public String generate(MailInfo mailInfo) {
        try {
            Template freemarkerTemplate = freemarkerConfigurer.getConfiguration()
                    .getTemplate("mail/activate.ftlh");
            return FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerTemplate, mailInfo.getProps());
        } catch (Exception ignored) {}
        return "";
    }

}
