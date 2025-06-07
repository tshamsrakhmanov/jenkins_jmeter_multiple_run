package org.example;


import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @GetMapping(value = "/get_sample")
    public String get_uuid_list() {
        return "ANSWER";
    }
}
