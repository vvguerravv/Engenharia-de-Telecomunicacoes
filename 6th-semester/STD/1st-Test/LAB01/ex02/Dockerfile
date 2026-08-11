
# De qual imagem já existente minha imagem irá derivar
FROM ubuntu:26.04

# Qual será o diretório inicial ao entrar na imagem
WORKDIR /app

# Comando que ele irá executar ao subir a imagem 
RUN apt-get update && \
    apt-get -y install netcat-openbsd figlet toilet nyancat && \
    rm -rf /var/lib/apt/lists/*


# Copia arquivos ou pastas da sua máquina local para dentro do sistema de arquivos da imagem Docker que está sendo montada
COPY message.txt /app/

# Edição do comando padrão ao construir a imagem
CMD [ "/bin/sh","-c", "cat message.txt | toilet -F border --gay -f smblock" ]

