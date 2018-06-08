# Comunicação com o Repositório

# 1 - Gerar chave SSH.

# Github

ssh-keygen -t rsa -b 4096 -C "luciano.teixeiras@gmail.com"

# GitLab

ssh-keygen -t rsa -C "luciano.teixeiras@gmail.com" -b 4096


# O resultado será:
  
# Generating public/private rsa key pair.  
# Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]  

# Defina uma senha, nomralmente a mesma do GitHub e/ou GitLab

# Your identification has been saved in /Users/you/.ssh/id_rsa.  
# Your public key has been saved in /Users/you/.ssh/id_rsa.pub.
# The key fingerprint is:
# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db seuemail@dominio.com

# 2 - Adicionar a chave criada ao ssh-agent.

# Ativando o agnete:
  
ssh-agent -s

# Add chave ao agente
  
ssh-add ~/.ssh/id_rsa

# 3 - Associar a chave gerada à conta do Github/GitLab.

# Copiando a chave para o cache do teclado:

cat ~/.ssh/id_rsa.pub | clip

#GitHub

git config --global user.email "luciano.teixeiras@gmail.com"
git config --global user.name "LucianoTeixeiras"
git config --global credential.helper 'cache --timeout=10000000'

#GitLab

git config --global user.email "luciano.teixeiras@gmail.com"
git config --global user.name "luciano.teixeiras"
git config --global credential.helper 'cache --timeout=10000000'
