package com.admiralxy.cinema.mail;

import lombok.*;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {
    private String emailTo;
    private String subject;
    private String templateCode;
    private Map<String, Object> props;
}
