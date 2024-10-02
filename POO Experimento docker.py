import psycopg2

class DatabaseManager:
    def __init__(self, host, port, database, user, password):
        self.host = host
        self.port = port
        self.database = database
        self.user = user
        self.password = password
        self.connection = None
        self.cursor = None

    def connect(self):
        try:
            self.connection = psycopg2.connect(
                host=self.host,
                port=self.port,
                database=self.database,
                user=self.user,
                password=self.password  
            )
            self.cursor = self.connection.cursor()
            print("Conexão bem-sucedida!")
        except Exception as e:
            print(f"Erro ao conectar: {e}")

    def close(self):
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
        print("Conexão encerrada.")

class CRUD(DatabaseManager):
    def create_table(self):
        try:
            self.cursor.execute("CREATE TABLE IF NOT EXISTS teste (id serial PRIMARY KEY, num INTEGER, data VARCHAR)")
            print("Criação bem-sucedida!")
        except Exception as e:
            print(f"Criação falhou: {e}")

    def insert_data(self):
        try:    
            self.cursor.execute("INSERT INTO teste (num, data) VALUES (%s, %s)", (1, "'abcdef'); drop table adsas;"))
            print("Dados inseridos com sucesso!")
        except Exception as e:
            print(f"Inserção falhou: {e}")

    def read_data(self):
        try:
            self.cursor.execute("SELECT * FROM teste;")
            results = self.cursor.fetchall()
            print(results)
        except Exception as e:
            print(f"Consulta falhou: {e}")

    def delete_data(self):
        try:
            self.cursor.execute("DELETE FROM teste;")
            print("Dados excluídos com sucesso!")
        except Exception as e:
            print(f"Incapaz de deletar: {e}")

    def commit(self):
        try:
            self.connection.commit()
            print("Mudanças confirmadas.")
        except Exception as e:
            print(f"Erro ao confirmar mudanças: {e}")

if __name__ == "__main__":
    while True:
        # Coleta de informações do usuário
        host = input("Insira o host do banco de dados: ")
        port = input("Insira a porta do banco de dados: ")
        database = input("Insira o nome do banco de dados: ")
        user = input("Insira o usuário do banco de dados: ")
        password = input("Insira a senha do banco de dados: ")

        # Criação da instância da classe CRUD
        db_manager = CRUD(host, port, database, user, password)

        # Tenta conectar
        if db_manager.connect():
            break  # Sai do loop se a conexão for bem-sucedida
        else:
            print("As credenciais estão incorretas. Tente novamente.")

    while True:
        print("\nEscolha uma opção:")
        print("1: Criar tabela")
        print("2: Inserir dados")
        print("3: Ler dados")
        print("4: Deletar dados")
        print("5: Confirmar mudanças")
        print("6: Fechar conexão")
        print("0: Sair")

        option = input("Digite a opção desejada: ")

        if option == '1':
            db_manager.create_table()
        elif option == '2':
            db_manager.insert_data()
        elif option == '3':
            db_manager.read_data()
        elif option == '4':
            db_manager.delete_data()
        elif option == '5':
            db_manager.commit()
        elif option == '6':
            db_manager.close()
            break  # Sair do loop após fechar a conexão
        elif option == '0':
            print("Saindo...")
            db_manager.close()  # Fechar conexão ao sair
            break
        else:
            print("Opção inválida! Tente novamente.")
        

    db_manager = CRUD(host, port, database, user, password)
    db_manager.connect()

  