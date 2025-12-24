#!/bin/bash

echo "======================================"
echo "TESTE 1: GET /tasks (deve retornar [])"
echo "======================================"
curl -i http://localhost:3000/tasks
echo -e "\n\n"

echo "======================================"
echo "TESTE 2: POST /tasks - Tarefa 1"
echo "======================================"
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste 1", "description": "Primeira tarefa", "status": "aberto"}'
echo -e "\n\n"

echo "======================================"
echo "TESTE 3: POST /tasks - Tarefa 2"
echo "======================================"
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste 2", "description": "Segunda tarefa", "status": "fazendo"}'
echo -e "\n\n"

echo "======================================"
echo "TESTE 4: GET /tasks (deve retornar 2 tarefas)"
echo "======================================"
curl -i http://localhost:3000/tasks
echo -e "\n\n"

echo "======================================"
echo "TESTE 5: GET /tasks/1"
echo "======================================"
curl -i http://localhost:3000/tasks/1
echo -e "\n\n"

echo "======================================"
echo "TESTE 6: PUT /tasks/1 - Atualizar status"
echo "======================================"
curl -i -X PUT http://localhost:3000/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{"status": "finalizado"}'
echo -e "\n\n"

echo "======================================"
echo "TESTE 7: GET /tasks/1 (verificar status)"
echo "======================================"
curl -i http://localhost:3000/tasks/1
echo -e "\n\n"

echo "======================================"
echo "TESTE 8: DELETE /tasks/1"
echo "======================================"
curl -i -X DELETE http://localhost:3000/tasks/1
echo -e "\n\n"

echo "======================================"
echo "TESTE 9: GET /tasks (deve retornar 1 tarefa)"
echo "======================================"
curl -i http://localhost:3000/tasks
echo -e "\n\n"

echo "======================================"
echo "TESTE 10: POST com título vazio (deve retornar 400)"
echo "======================================"
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "", "description": "Teste", "status": "aberto"}'
echo -e "\n\n"

echo "======================================"
echo "TESTE 11: POST com status inválido (deve retornar 400)"
echo "======================================"
curl -i -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste", "description": "Teste", "status": "invalido"}'
echo -e "\n\n"

echo "======================================"
echo "TESTE 12: GET /tasks/999 (deve retornar 404)"
echo "======================================"
curl -i http://localhost:3000/tasks/999
echo -e "\n\n"

echo "======================================"
echo "TESTES CONCLUÍDOS"
echo "======================================"
