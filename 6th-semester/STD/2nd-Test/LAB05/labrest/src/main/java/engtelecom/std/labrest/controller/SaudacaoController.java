package engtelecom.std.labrest.controller;


import engtelecom.std.labrest.entities.Saudacao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicInteger;

@RestController
public class SaudacaoController {

    private AtomicInteger id = new AtomicInteger(0);

    @GetMapping("/saudacao")
    public Saudacao ola(@RequestParam(value = "nome", defaultValue = "mundo") String nome){

        return new Saudacao(id.getAndIncrement(),"Olá " + nome);
    }

}
