package com.bafconsulting.configurator.portal.config;

import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableFeignClients(basePackages = "com.bafconsulting.configurator.portal")
public class FeignConfiguration {

}
