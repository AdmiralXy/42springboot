package com.admiralxy.cinema.config;

import com.admiralxy.cinema.security.CinemaUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;

@EnableWebSecurity
public class SecurityConfig {

    @Value("${spring.security.remember-me.secret}")
    private String rememberMeSecret;

    private final CinemaUserDetailsService userDetailService;

    @Autowired
    public SecurityConfig(CinemaUserDetailsService userDetailService) {
        this.userDetailService = userDetailService;
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authManager(HttpSecurity http, PasswordEncoder passwordEncoder) throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)
                .userDetailsService(userDetailService)
                .passwordEncoder(passwordEncoder)
                .and()
                .build();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.headers()
                .addHeaderWriter(new XFrameOptionsHeaderWriter(XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN))
                .and()
                .authorizeRequests()
                    .antMatchers("/css/**", "/js/**", "/ico/**").permitAll()
                    .antMatchers("/sign**").permitAll()
                    .antMatchers("/admin/**").hasRole("ADMIN")
                    .anyRequest().authenticated()
                .and()
                    .formLogin()
                    .loginPage("/signIn")
                    .loginProcessingUrl("/signIn")
                .and()
                    .logout()
                    .logoutUrl("/signOut")
                    .deleteCookies("JSESSIONID")
                .and()
                    .rememberMe().key(rememberMeSecret).userDetailsService(userDetailService).tokenValiditySeconds(86400 * 30);

        return http.build();
    }
}
