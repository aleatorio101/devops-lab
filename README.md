# DevOps Lab

> Projeto prático focado em CI/CD e automação, desenvolvido para aprofundar conhecimentos em DevOps/SRE.

---

## Stack

| Camada | Tecnologia |
|--------|-----------|
| App | Java 17 + Spring Boot 3 |
| Container | Docker (multi-stage build) |
| CI/CD | GitHub Actions |
| Cloud | AWS (em breve) |
| IaC | Terraform (em breve) |

---

## Estrutura do Repositório

```
devops-lab/
├── app/                        # Aplicação Java (Spring Boot)
│   ├── src/
│   │   ├── main/java/com/devopslab/
│   │   │   ├── Application.java
│   │   │   └── HelloController.java
│   │   └── test/java/com/devopslab/
│   │       └── HelloControllerTest.java
│   └── pom.xml
├── .github/
│   └── workflows/
│       └── ci.yml              # Pipeline de CI
├── Dockerfile                  # Build multi-stage
└── README.md
```

---

## ⚙️ Pipeline CI/CD

O pipeline é acionado a cada `push` na `main` ou `develop` e a cada Pull Request:

```
push/PR → Build & Test → Docker Build
```

**Jobs:**
- **Build & Test** — Compila o projeto, roda os testes e gera o JAR
- **Docker Build** — Constrói a imagem Docker com cache otimizado

---

## Rodando localmente

### Pré-requisitos
- Java 17+
- Maven 3.9+
- Docker

### Sem Docker
```bash
cd app
mvn clean package
java -jar target/devops-lab-1.0.0.jar
```

### Com Docker
```bash
docker build -t devops-lab .
docker run -p 8080:8080 devops-lab
```

Acesse: [http://localhost:8080](http://localhost:8080)

---

## Roadmap

- [x] Fase 1 — App Java + Docker + GitHub Actions CI
- [ ] Fase 2 — Push para AWS ECR + deploy no ECS
- [ ] Fase 3 — Infraestrutura com Terraform
- [ ] Fase 4 — Ambientes dev/prod + monitoramento (CloudWatch)

---

## Autor

Projeto desenvolvido como laboratório pessoal para prática de DevOps.
