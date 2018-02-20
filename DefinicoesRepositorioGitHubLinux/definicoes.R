#Teste de comunicação com o repositorio

#1- Precisamos gerar uma chave SSH que seu computador vai usar pra se autorizar com o Github. Digite o seguinte comando no Git Bash:
  
ssh-keygen -t rsa -b 4096 -C "luciano.teixeiras@gmail.com"  

#O resultado será:
  
# Generating public/private rsa key pair.  
# Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]  
# Você quer salvar a chave nesse arquivo mesmo, só dê enter.

Depois, ele vai pedir uma senha:
  
  Enter passphrase (empty for no passphrase): [Type a passphrase]  
Enter same passphrase again: [Type passphrase again]  
Essa senha você vai ter que digitar toda vez que for baixar algo de um repositório ou enviar algo pra lá. Eu deixo sem mesmo. 
Se quiser deixar sem, só dê enter. Se não, coloque a senha e confirme.

Em seguida, você verá uma mensagem dizendo que deu tudo certo:
  
  Your identification has been saved in /Users/you/.ssh/id_rsa.  
# Your public key has been saved in /Users/you/.ssh/id_rsa.pub.
# The key fingerprint is:
# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db seuemail@dominio.com
2- Agora, precisamos adicionar a chave que criamos ao ssh-agent. Primeiro, vamos ativa-lo:
  
  ssh-agent -s  

Em seguida, vamos adicionar a chave que geramos ao ssh-agent:
  
ssh-add ~/.ssh/id_rsa

3- Agora, vamos associar a chave que geramos à nossa conta do Github. 
Para copiar a chave do bash, digite o seguinte comando:
  
clip < ~/.ssh/id_rsa.pub  

#Tools/Shell

git config --global user.email "luciano.teixeiras@gmail.com"
git config --global user.name "LucianoTeixeiras"
git config --global credential.helper 'cache --timeout=10000000'
