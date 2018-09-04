FROM drydock/u16phpall:v6.7.4
WORKDIR /home/app/lara
COPY ./lara/* /home/app/lara/
#RUN composer global require "laravel/installer"
#RUN export PATH=~/.composer/vendor/bin:$PATH && laravel new blog
EXPOSE 8080

