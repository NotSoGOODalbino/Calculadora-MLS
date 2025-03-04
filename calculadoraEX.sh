import sys

def sair():

    print("\n Saindo do programa... Obrigado por usar a calculadora!")
    try:
        sys.exit()  # Tenta sair normalmente
    except SystemExit:
        pass  # Ignora o erro "SystemExit" no Colab

def obter_numero(mensagem, permitir_voltar=True):
    while True:
        entrada = input(mensagem).strip().upper()
        if entrada == "S":
            sair()
            return None
        if permitir_voltar and entrada == "A":
            return "Atras"
        try:
            return float(entrada)
        except ValueError:
            print("Entrada inválida. Digite um número válido ou 'S' para sair.")

def calcular():
    while True:
        print("\n--- CALCULADORA ---")
        num1 = obter_numero("Digite o primeiro número (ou 'S' para sair): ", permitir_voltar=False)
        if num1 is None:
            return

        while True:
            num2 = obter_numero("Digite o segundo número (ou 'A' para voltar, 'S' para sair): ")
            if num2 == "Atras":
                break
            if num2 is None:
                return

            while True:
                print("\n Escolha uma operação:")
                print("1️  - Soma (+)")
                print("2  - Subtração (-)")
                print("3  - Multiplicação (*)")
                print("4️  - Divisão (/)")
                print("5  - Potência (**)")
                print("6️  - Módulo (%)")
                print("7️  - Média")
                print("8️  - Maior número")
                print("9️  - Menor número")
                print("P  - Voltar e escolher novos números")
                print("S️  - Sair")

                opcao = input("Digite o número da operação: ").strip().upper()

                if opcao == "0":
                    break
                elif opcao == "S":
                    sair()
                    return
                elif opcao == "1":
                    resultado = num1 + num2
                elif opcao == "2":
                    resultado = num1 - num2
                elif opcao == "3":
                    resultado = num1 * num2
                elif opcao == "4":
                    resultado = "Não é possível dividir por zero." if num2 == 0 else num1 / num2
                elif opcao == "5":
                    resultado = num1 ** num2
                elif opcao == "6":
                    resultado = num1 % num2
                elif opcao == "7":
                    resultado = (num1 + num2) / 2
                elif opcao == "8":
                    resultado = max(num1, num2)
                elif opcao == "9":
                    resultado = min(num1, num2)
                else:
                    print("Opção inválida. Tente novamente.")
                    continue

                print(f"\n Resultado: {resultado}")

                while True:
                    continuar = input("\n Deseja escolher novos números (P) ou sair (S)? ").strip().upper()
                    if continuar == "P":
                        break
                    elif continuar == "S":
                        sair()
                        return
                    else:
                        print("Opção inválida. Digite 'P' para novos números ou 'S' para sair.")

                break

            break

calcular()

