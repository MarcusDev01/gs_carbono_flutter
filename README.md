🌿 GS Carbono — Monitoramento de Emissões de Carbono
<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.8+-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Provider-6.1.5-4CAF50?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Global_Solution-FIAP-red?style=for-the-badge" />
</p>
<p align="center">
  Aplicativo mobile desenvolvido como parte da <strong>Global Solution (FIAP)</strong> para monitorar, registrar e acompanhar emissões de carbono em tempo real.
</p>

📱 Sobre o Projeto
O GS Carbono é um aplicativo Flutter voltado à conscientização e rastreamento de emissões de carbono. A proposta é permitir que usuários registrem suas atividades cotidianas — como transporte, consumo de energia e alimentação — e visualizem o impacto ambiental gerado em forma de CO₂ equivalente (CO₂e).
O projeto integra o ecossistema da Global Solution da FIAP, com foco em sustentabilidade e tecnologia para um futuro mais verde.

✨ Funcionalidades

📊 Dashboard de emissões — visão geral do carbono emitido por período
➕ Registro de atividades — transporte, energia, consumo e outros
📈 Histórico e tendências — acompanhe sua evolução ao longo do tempo
🌱 Metas de redução — defina e monitore objetivos pessoais de carbono
🔔 Alertas e dicas — sugestões para reduzir sua pegada de carbono
📱 Multiplataforma — funciona em Android, iOS, Web, Desktop (Linux, macOS, Windows)


🛠️ Tecnologias Utilizadas
TecnologiaVersãoFinalidadeFlutter≥ 3.xFramework UI multiplataformaDart≥ 3.8.0Linguagem de programaçãoProvider^6.1.5Gerenciamento de estadoMaterial Design—Sistema de design

🚀 Como Executar
Pré-requisitos

Flutter SDK ≥ 3.x instalado
Dart SDK ≥ 3.8.0
Um emulador Android/iOS ou dispositivo físico conectado
Android Studio ou VS Code com extensão Flutter

Instalação
bash# 1. Clone o repositório
git clone https://github.com/MarcusDev01/gs_carbono_flutter.git

# 2. Acesse o diretório do projeto
cd gs_carbono_flutter

# 3. Instale as dependências
flutter pub get

# 4. Verifique o ambiente
flutter doctor

# 5. Execute o app
flutter run
Plataformas suportadas
bash# Android
flutter run -d android

# iOS (requer macOS)
flutter run -d ios

# Web
flutter run -d chrome

# Desktop
flutter run -d linux   # ou macos / windows

📁 Estrutura do Projeto
gs_carbono_flutter/
├── lib/                    # Código-fonte principal (Dart)
│   └── main.dart           # Ponto de entrada da aplicação
├── android/                # Configurações Android
├── ios/                    # Configurações iOS
├── web/                    # Configurações Web
├── linux/                  # Configurações Linux
├── macos/                  # Configurações macOS
├── windows/                # Configurações Windows
├── test/                   # Testes automatizados
├── pubspec.yaml            # Dependências e metadados do projeto
└── README.md

🧪 Testes
bash# Executar todos os testes
flutter test

# Executar com relatório de cobertura
flutter test --coverage

👤 Autores
NomeGitHubMarcus Dev@MarcusDev01

📄 Licença
Este projeto foi desenvolvido para fins acadêmicos como parte da Global Solution — FIAP. Todos os direitos reservados aos autores.

🌍 Contribuindo com o Planeta

"A tecnologia é uma das ferramentas mais poderosas que temos para enfrentar a crise climática." 🌱

Se este projeto te inspirou, considere monitorar suas próprias emissões e incentivar outras pessoas a fazerem o mesmo.
