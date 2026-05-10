package vn.qui.baloshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import jakarta.servlet.DispatcherType;
import vn.qui.baloshop.domain.User;
import vn.qui.baloshop.service.UserService;
import vn.qui.baloshop.service.userinfo.CustomOAuth2UserService;
import vn.qui.baloshop.service.validator.CustomUserDetailsService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {
        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public UserDetailsService userDetailsService(UserService userService) {
                return new CustomUserDetailsService(userService);
        }

        @Bean
        public DaoAuthenticationProvider authProvider(
                        PasswordEncoder passwordEncoder,
                        UserDetailsService userDetailsService) {

                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                authProvider.setHideUserNotFoundExceptions(false);

                return authProvider;
        }

        @Bean
        public AuthenticationSuccessHandler CustomSuccessHandler() {
                return new CustomSuccessHandler();
        }

        @Bean
        public SpringSessionRememberMeServices rememberMeServices() {
                SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
                // optionally customize
                rememberMeServices.setAlwaysRemember(true);
                return rememberMeServices;
        }

        @Bean
        SecurityFilterChain filterChain(HttpSecurity http, UserService userService) throws Exception {
                http
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                                                DispatcherType.INCLUDE)
                                                .permitAll()

                                                .requestMatchers("/", "/login", "/register", "/product/**",
                                                                "/client/**", "/css/**", "/js/**", "/products/**",
                                                                "/images/**")
                                                .permitAll()
                                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                                .anyRequest().authenticated())
                                // oauth2 login
                                .oauth2Login(oauth2 -> oauth2.loginPage("/login")
                                                .successHandler(CustomSuccessHandler())
                                                .failureUrl("/login?error")
                                                .userInfoEndpoint(user -> user
                                                                .userService(new CustomOAuth2UserService(userService))))
                                .sessionManagement((sessionManagement) -> sessionManagement
                                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                                                .invalidSessionUrl("/logout?expired")
                                                .maximumSessions(1)
                                                .maxSessionsPreventsLogin(false))

                                .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))

                                .rememberMe((rememberMe) -> rememberMe
                                                .rememberMeServices(rememberMeServices()))

                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureUrl("/login?error")
                                                .successHandler(CustomSuccessHandler())
                                                .permitAll())
                                .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));

                return http.build();
        }

}
