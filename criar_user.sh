#!/bin/bash

echo "Criando usuários do sistema..."

# Lista de usuários que deseja criar
usuarios=("guest01" "guest02" "guest03")

# Senha padrão
senha="senha"

# Loop para criar os usuários
for usuario in "${usuarios[@]}"; do
    echo "Criando usuário $usuario..."
    useradd $usuario -c "Convidado" -s /bin/bash -m -p $(openssl passwd -6  "$senha")
    if [ $? -eq 0 ]; then
        passwd $usuario -e
        echo "Usuário $usuario criado com sucesso!"
    else
        echo "Erro ao criar o usuário $usuario."
    fi
done
echo "Processo finalizado com sucesso!"

