#!/bin/bash

BASE_URL="http://localhost:3000"

echo "=========================================="
echo "TESTE 1: GET /tasks (deve retornar [])"
echo "=========================================="
RESPONSE1=$(curl -s -w "\nHTTP_CODE:%{http_code}" $BASE_URL/tasks)
HTTP_CODE1=$(echo "$RESPONSE1" | grep "HTTP_CODE" | cut -d: -f2)
BODY1=$(echo "$RESPONSE1" | sed '$d')
echo "Status Code: $HTTP_CODE1"
echo "Body: $BODY1"
if [ "$HTTP_CODE1" = "200" ] && [ "$BODY1" = "[]" ]; then
    echo "✅ TESTE 1 PASSOU"
else
    echo "❌ TESTE 1 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 2: POST /tasks - Tarefa 1"
echo "=========================================="
RESPONSE2=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X POST $BASE_URL/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste 1", "description": "Primeira tarefa", "status": "aberto"}')
HTTP_CODE2=$(echo "$RESPONSE2" | grep "HTTP_CODE" | cut -d: -f2)
BODY2=$(echo "$RESPONSE2" | sed '$d')
echo "Status Code: $HTTP_CODE2"
echo "Body: $BODY2"
if [ "$HTTP_CODE2" = "201" ]; then
    echo "✅ TESTE 2 PASSOU"
else
    echo "❌ TESTE 2 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 3: POST /tasks - Tarefa 2"
echo "=========================================="
RESPONSE3=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X POST $BASE_URL/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste 2", "description": "Segunda tarefa", "status": "fazendo"}')
HTTP_CODE3=$(echo "$RESPONSE3" | grep "HTTP_CODE" | cut -d: -f2)
BODY3=$(echo "$RESPONSE3" | sed '$d')
echo "Status Code: $HTTP_CODE3"
echo "Body: $BODY3"
if [ "$HTTP_CODE3" = "201" ]; then
    echo "✅ TESTE 3 PASSOU"
else
    echo "❌ TESTE 3 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 4: GET /tasks (deve retornar 2 tarefas)"
echo "=========================================="
RESPONSE4=$(curl -s -w "\nHTTP_CODE:%{http_code}" $BASE_URL/tasks)
HTTP_CODE4=$(echo "$RESPONSE4" | grep "HTTP_CODE" | cut -d: -f2)
BODY4=$(echo "$RESPONSE4" | sed '$d')
echo "Status Code: $HTTP_CODE4"
echo "Body: $BODY4"
TASK_COUNT=$(echo "$BODY4" | grep -o '"id":' | wc -l)
if [ "$HTTP_CODE4" = "200" ] && [ "$TASK_COUNT" = "2" ]; then
    echo "✅ TESTE 4 PASSOU"
else
    echo "❌ TESTE 4 FALHOU (encontradas $TASK_COUNT tarefas)"
fi
echo ""

echo "=========================================="
echo "TESTE 5: GET /tasks/1"
echo "=========================================="
RESPONSE5=$(curl -s -w "\nHTTP_CODE:%{http_code}" $BASE_URL/tasks/1)
HTTP_CODE5=$(echo "$RESPONSE5" | grep "HTTP_CODE" | cut -d: -f2)
BODY5=$(echo "$RESPONSE5" | sed '$d')
echo "Status Code: $HTTP_CODE5"
echo "Body: $BODY5"
if [ "$HTTP_CODE5" = "200" ]; then
    echo "✅ TESTE 5 PASSOU"
else
    echo "❌ TESTE 5 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 6: PUT /tasks/1 - Atualizar status"
echo "=========================================="
RESPONSE6=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X PUT $BASE_URL/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{"status": "finalizado"}')
HTTP_CODE6=$(echo "$RESPONSE6" | grep "HTTP_CODE" | cut -d: -f2)
BODY6=$(echo "$RESPONSE6" | sed '$d')
echo "Status Code: $HTTP_CODE6"
echo "Body: $BODY6"
if [ "$HTTP_CODE6" = "200" ]; then
    echo "✅ TESTE 6 PASSOU"
else
    echo "❌ TESTE 6 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 7: GET /tasks/1 (verificar status)"
echo "=========================================="
RESPONSE7=$(curl -s -w "\nHTTP_CODE:%{http_code}" $BASE_URL/tasks/1)
HTTP_CODE7=$(echo "$RESPONSE7" | grep "HTTP_CODE" | cut -d: -f2)
BODY7=$(echo "$RESPONSE7" | sed '$d')
echo "Status Code: $HTTP_CODE7"
echo "Body: $BODY7"
if [ "$HTTP_CODE7" = "200" ] && echo "$BODY7" | grep -q '"finalizado"'; then
    echo "✅ TESTE 7 PASSOU (status atualizado para finalizado)"
else
    echo "❌ TESTE 7 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 8: DELETE /tasks/1"
echo "=========================================="
RESPONSE8=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X DELETE $BASE_URL/tasks/1)
HTTP_CODE8=$(echo "$RESPONSE8" | grep "HTTP_CODE" | cut -d: -f2)
BODY8=$(echo "$RESPONSE8" | sed '$d')
echo "Status Code: $HTTP_CODE8"
echo "Body: $BODY8"
if [ "$HTTP_CODE8" = "200" ] || [ "$HTTP_CODE8" = "204" ]; then
    echo "✅ TESTE 8 PASSOU"
else
    echo "❌ TESTE 8 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 9: GET /tasks (deve retornar 1 tarefa)"
echo "=========================================="
RESPONSE9=$(curl -s -w "\nHTTP_CODE:%{http_code}" $BASE_URL/tasks)
HTTP_CODE9=$(echo "$RESPONSE9" | grep "HTTP_CODE" | cut -d: -f2)
BODY9=$(echo "$RESPONSE9" | sed '$d')
echo "Status Code: $HTTP_CODE9"
echo "Body: $BODY9"
TASK_COUNT9=$(echo "$BODY9" | grep -o '"id":' | wc -l)
if [ "$HTTP_CODE9" = "200" ] && [ "$TASK_COUNT9" = "1" ]; then
    echo "✅ TESTE 9 PASSOU"
else
    echo "❌ TESTE 9 FALHOU (encontradas $TASK_COUNT9 tarefas)"
fi
echo ""

echo "=========================================="
echo "TESTE 10: POST com título vazio (deve retornar 400)"
echo "=========================================="
RESPONSE10=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X POST $BASE_URL/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "", "description": "Teste", "status": "aberto"}')
HTTP_CODE10=$(echo "$RESPONSE10" | grep "HTTP_CODE" | cut -d: -f2)
BODY10=$(echo "$RESPONSE10" | sed '$d')
echo "Status Code: $HTTP_CODE10"
echo "Body: $BODY10"
if [ "$HTTP_CODE10" = "400" ]; then
    echo "✅ TESTE 10 PASSOU"
else
    echo "❌ TESTE 10 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 11: POST com status inválido (deve retornar 400)"
echo "=========================================="
RESPONSE11=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X POST $BASE_URL/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Teste", "description": "Teste", "status": "invalido"}')
HTTP_CODE11=$(echo "$RESPONSE11" | grep "HTTP_CODE" | cut -d: -f2)
BODY11=$(echo "$RESPONSE11" | sed '$d')
echo "Status Code: $HTTP_CODE11"
echo "Body: $BODY11"
if [ "$HTTP_CODE11" = "400" ]; then
    echo "✅ TESTE 11 PASSOU"
else
    echo "❌ TESTE 11 FALHOU"
fi
echo ""

echo "=========================================="
echo "TESTE 12: GET /tasks/999 (deve retornar 404)"
echo "=========================================="
RESPONSE12=$(curl -s -w "\nHTTP_CODE:%{http_code}" $BASE_URL/tasks/999)
HTTP_CODE12=$(echo "$RESPONSE12" | grep "HTTP_CODE" | cut -d: -f2)
BODY12=$(echo "$RESPONSE12" | sed '$d')
echo "Status Code: $HTTP_CODE12"
echo "Body: $BODY12"
if [ "$HTTP_CODE12" = "404" ]; then
    echo "✅ TESTE 12 PASSOU"
else
    echo "❌ TESTE 12 FALHOU"
fi
echo ""

echo "=========================================="
echo "RESUMO DOS TESTES"
echo "=========================================="
