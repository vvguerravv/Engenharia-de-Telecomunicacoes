package engtelecom.std.labrest.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record PessoaEmailDTO(
        @NotBlank(message = "Email não pode estar em braco")
        @Email(message = "Endereço de email inválido")
        String email
) {}
