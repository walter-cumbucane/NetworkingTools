# 🔄 MikroTik Automatic Backup Tool

Ferramenta automatizada para realizar **backups da configuração de routers MikroTik** utilizando a API RouterOS, com interface web moderna e responsiva. Ideal para administradores de rede que desejam manter backups centralizados, organizados e com mínimo esforço.

## ✨ Funcionalidades

- Varre uma rede IP fornecida pelo usuario e identifica quais Mikrotiks estão online
- Conecta via API RouterOS para exportar a configuração atual (`.rsc`)
- Ativa o serviço FTP automaticamente para baixar o backup
- Faz o download do backup e desativa o serviço FTP em seguida
- Disponível também via interface web com Flask, com feedback visual elegante

## 📦 Requisitos

**⚙️ Instalação**

_Clone o repositório:_

git clone https://github.com/walter-cumbucane/NetworkingTools.git

cd NetworkingTools/mikrotik/automatic_backup

_Instale as dependências:_

pip install flask ping3

_Inicie o servidor Python:_

python app.py

_Acesse no navegador:_

http://localhost:5000


🙋 Autor

Walter Cumbucane

https://www.linkedin.com/in/walter-cumbucane-23b3b6231



📄 Licença

MIT License — livre para uso, modificação e distribuição com atribuição.



