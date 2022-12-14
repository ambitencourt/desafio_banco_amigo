# Banco Amigo
![Concept:](https://img.shields.io/badge/Concept-Test-green)

Um aplicativo opensource com as funcionalidades básicas de um banco.

Link do protótipo final(figma): https://www.figma.com/file/vpaNT5w2hjCGWsfvLLnCDg/Banco-Amigo?node-id=0%3A1&t=12AcUzor0OgNqphK-1



<p align="center"> • 
 <a href="#features">Features</a> •
 <a href="#roadmap">Roadmap</a> • 
 <a href="#demonstração">Demonstração</a> • 
 <a href="#como-utilizar">Como utilizar</a> •
 <a href="#tecnologias">Tecnologias</a> • 
 <a href="#packages">Packages</a> • 
 <a href="#contribuição">Contribuição</a>  •
 <a href="#desenvolvedor">Desenvolvedor</a> •
 <a href="#licença">Licença</a>
</p>

## 🧩Features

- [x] ValueNotifier como gerenciamento de estado principal;
- [x] Responsividade com Flex Widgets e MediaQuery;
- [x] Gerenciamento de rotas, modularização e Injeção de dependências com Flutter Modular;
- [x] Backend Mockado com Json Server;
- [x] Custom Widgets e desacoplamento de services;
- [x] Clean architeture;
- [x] Firebase Auth

## 🗺Roadmap
1. Desenvolvimento da estrutura base de pastas tendo como referência o Clean Dart;
2. Implementação do Flutter Modular com as rotas iniciais;
3. Desenvolvimento das classes responsáveis por conexão com o Firebase;
4. Implementado a regra de negócios e integração com o Firebase;
5. Implementado gerenciamento de estado com ValueNotifier;
6. Desenvolvimento de customs widgets  e desacoplamento de services para padronização do app;
7. Desenvolvimento das funcionalidades;
8. Organização do fluxo do aplicativo;
9. Reestruturação nas pages;
10. Refactory do Mock da API;


## 🎨Demonstração

Seguem telas:


<img src="https://github.com/ambitencourt/desafio_banco_amigo/blob/master/assets/images/Presentation/login.jpg" height="300em"/><img src="https://github.com/ambitencourt/desafio_banco_amigo/blob/master/assets/images/Presentation/register.jpg" height="300em"/><img src="https://github.com/ambitencourt/desafio_banco_amigo/blob/master/assets/images/Presentation/register2.jpg" height="300em"/><img src="https://github.com/ambitencourt/desafio_banco_amigo/blob/master/assets/images/Presentation/home.jpg" height="300em"/><img src="https://github.com/ambitencourt/desafio_banco_amigo/blob/master/assets/images/Presentation/home2.jpg" height="300em"/>


## 🏁Como utilizar

1. Instale o NodeJs(https://nodejs.org/en/), caso já tenha instalado, siga até o passo 2;
2. Primeiro instale o Json Server com o comando:
   ```npm install -g json-server```
3. Inicialize o Json Server no terminal de sua IDE(Vscode, Android Studio...) com o comando:
  ```json-server --watch db.json --routes routes.json --port 8080``` 
4. Execute em um emulador Android; 
5. Crie uma conta no aplicativo e faça login;
6. Para testar a operação de transferência, insira o valor que quer transferir e informe o número da conta de destino(accountNumber) presente no arquivo db.json, como na imagem abaixo: 
<img src="https://github.com/ambitencourt/desafio_banco_amigo/blob/master/assets/images/Presentation/transferir.JPG" height="300em"/>


## 🛠Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

## 📦Packages

Os seguintes packages foram utilizados no projeto:

- [Flutter Modular](https://pub.dev/packages?q=flutter_modular)
- [Firebase Auth](https://pub.dev/packages/firebase_auth)
- [Google Fonts](https://pub.dev/packages/google_fonts) 
- [IconSax](https://pub.dev/packages/iconsax)
- [Firebase Core](https://pub.dev/packages/firebase_core)
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore)
- [Dio](https://pub.dev/packages/dio)
- [Asuka](https://pub.dev/packages/asuka)
- [Intl](https://pub.dev/packages/intl)
## 🤝Contribuição

1. Faça um **fork** do projeto.
2. Crie uma nova branch com as suas alterações: `git checkout -b my-feature`
3. Salve as alterações e crie uma mensagem de commit contando o que você fez: `git commit -m "feature: My new feature"`
4. Envie as suas alterações: `git push origin my-feature`
> Caso tenha alguma dúvida confira este [guia de como contribuir no GitHub](./CONTRIBUTING.md)

---

## 📱Desenvolvedor

<table>
<tr>

<td>
<div align="center">
<a href="https://github.com/ambitencourt">
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/73924078?s=400&u=111fa3d893e5677088f0f0d8d4d74e52fdbc4e39&v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Adriano Bitencourt</b></sub></a> <a href="https://github.com/ambitencourt" title="Github"></a>
<p>

[![Linkedin Badge](https://img.shields.io/badge/-Adriano-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/adrianombitencourt/)](https://www.linkedin.com/in/adrianombitencourt/) 
[![Gmail Badge](https://img.shields.io/badge/-Gmail-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:adriano.mirandabitencourt@gmail.com)](mailto:adriano.mirandabitencourt@gmail.com)
</div>

</td>
</tr>
</table>

## 📝Licença

Este projeto esta sobe a licença [MIT](./LICENSE).
Projeto desenvolvido para fins de verificação de habilidades, disponibilizado publicamente para ser replicado e utilizado.


## Status

![Status: Em desenvolvimento](https://img.shields.io/badge/Status-Em%20desenvolvimento-blue)
