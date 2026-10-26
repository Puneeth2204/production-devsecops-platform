package com.hospital.api;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HealthController {

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of(
            "status", "UP",
            "application", "hospital-management-api"
        );
    }

    @GetMapping("/patients")
    public Map<String, Object> patients() {
        return Map.of(
            "message", "Hospital Management API is running",
            "patients", java.util.List.of()
        );
    }
}
