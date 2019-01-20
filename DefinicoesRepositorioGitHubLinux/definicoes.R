# Comunicação com o Repositório

# 1 - Gerar chave SSH.

# Github

ssh-keygen -t rsa -b 4096 -C "luciano.teixeiras@gmail.com"

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

# GitSubtree

git remote add EstatisticaTeoriaPratica https://github.com/LucianoTeixeiras/UdemyEstatisticaTeoriaPratica.git

git subtree add --prefix=EstatisticaTeoriaPratica/ EstatisticaTeoriaPratica master
