package vn.qui.baloshop.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cloudinary.Cloudinary;

@Configuration
public class CloudinaryConfig {
    @Bean
    public Cloudinary cloudinary() {
        Map<String, String> config = new HashMap();
        config.put("cloud_name", "dck5lvbzy");
        config.put("api_key", "696142141542511");
        config.put("api_secret", "YUJ6Y");
        return new Cloudinary(config);
    }
}
