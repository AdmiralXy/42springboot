package com.admiralxy.cinema.mail;

import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

public abstract class MailGenerator {

    protected final FreeMarkerConfigurer freemarkerConfigurer;

    public MailGenerator(FreeMarkerConfigurer freemarkerConfigurer) {
        this.freemarkerConfigurer = freemarkerConfigurer;
    }

    public abstract String generate(MailInfo mailInfo);
}
