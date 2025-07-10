# 🔄 MikroTik Automatic Backup Tool

Ferramenta automatizada para realizar **backups da configuração de routers MikroTik** utilizando a API RouterOS, com interface web moderna e responsiva. Ideal para administradores de rede que desejam manter backups centralizados, organizados e com mínimo esforço.

## ✨ Funcionalidades

- Varre uma rede IP fornecida pelo usuario e identifica quais Mikrotiks estão online
- Conecta via API RouterOS para exportar a configuração atual (`.rsc`)
- Ativa o serviço FTP automaticamente para baixar o backup
- Faz o download do backup e desativa o serviço FTP em seguida
- Disponível também via interface web com Flask, com feedback visual elegante

## 📦 Requisitos

Instale as dependências antes de executar o software com:

pip install flask ping3

⚙️ Instalação

Clone o repositório:

git clone https://github.com/walter-cumbucane/NetworkingTools.git

cd NetworkingTools/mikrotik/automatic_backup

Instale as dependências:

pip install flask ping3

Inicie o servidor Python:

python app.py

Acesse no navegador:

http://localhost:5000


🙋 Autor

Walter Cumbucane

https://www.linkedin.com/in/walter-cumbucane-23b3b6231



📄 Licença

MIT License — livre para uso, modificação e distribuição com atribuição.



