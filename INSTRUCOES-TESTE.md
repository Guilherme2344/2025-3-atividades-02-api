# Instruções para Testar a API de Tarefas

Execute os seguintes comandos curl em sequência no seu terminal:

## TESTE 1: GET /tasks (deve retornar [])
```bash
curl -i http://localhost:3000/tasks
```
**Esperado**: Status 200, Body: `[]`

---

## TESTE 2: POST /tasks - Tarefa 1
```bash
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste 1", "description": "Primeira tarefa", "status": "aberto"}'
```
**Esperado**: Status 201, Body com a tarefa criada contendo id, title, description, status

---

## TESTE 3: POST /tasks - Tarefa 2
```bash
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste 2", "description": "Segunda tarefa", "status": "fazendo"}'
```
**Esperado**: Status 201, Body com a tarefa criada

---

## TESTE 4: GET /tasks (deve retornar 2 tarefas)
```bash
curl -i http://localhost:3000/tasks
```
**Esperado**: Status 200, Body: array com 2 tarefas

---

## TESTE 5: GET /tasks/1
```bash
curl -i http://localhost:3000/tasks/1
```
**Esperado**: Status 200, Body com a primeira tarefa

---

## TESTE 6: PUT /tasks/1 - Atualizar status
```bash
curl -i -X PUT http://localhost:3000/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{"status": "finalizado"}'
```
**Esperado**: Status 200, Body com a tarefa atualizada

---

## TESTE 7: GET /tasks/1 (verificar status atualizado)
```bash
curl -i http://localhost:3000/tasks/1
```
**Esperado**: Status 200, Body com status = "finalizado"

---

## TESTE 8: DELETE /tasks/1
```bash
curl -i -X DELETE http://localhost:3000/tasks/1
```
**Esperado**: Status 200 ou 204

---

## TESTE 9: GET /tasks (deve retornar 1 tarefa)
```bash
curl -i http://localhost:3000/tasks
```
**Esperado**: Status 200, Body: array com apenas 1 tarefa (a segunda)

---

## TESTE 10: POST com título vazio (deve retornar 400)
```bash
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "", "description": "Teste", "status": "aberto"}'
```
**Esperado**: Status 400, mensagem de erro de validação

---

## TESTE 11: POST com status inválido (deve retornar 400)
```bash
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste", "description": "Teste", "status": "invalido"}'
```
**Esperado**: Status 400, mensagem de erro de validação

---

## TESTE 12: GET /tasks/999 (deve retornar 404)
```bash
curl -i http://localhost:3000/tasks/999
```
**Esperado**: Status 404, mensagem de tarefa não encontrada

---

## Executar Todos os Testes de Uma Vez

Você pode executar o script criado:
```bash
bash /workspaces/2025-3-atividades-02-api/run-tests.sh
```

Ou use o script existente:
```bash
bash /workspaces/2025-3-atividades-02-api/tasks-api/test-api.sh
```
