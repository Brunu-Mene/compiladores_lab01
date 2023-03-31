import subprocess

def runTester(file_in, file_out):
    with open(file_in, 'r') as f:
        conteudo = f.read()
    saida = subprocess.run('./a.out', input=conteudo, shell=True, stdout=subprocess.PIPE, universal_newlines=True)

    with open(file_out, "r") as f:
        output = f.read()

        if output == saida.stdout:
            print("SUCESSO")
        else:
            print(f"DEU RUIM, Seu output:")
            print(saida.stdout)
            print('Output esperado:')
            print(output)
            print()


if __name__ == '__main__':
    print("Teste C:")
    for i in range(1,11):
        if i < 10:
            file_in = f'in/c0{i}.ezl'
            file_out = f'out01_c/c0{str(i)}.out'
        if i == 10:
            file_in = f'in/c{i}.ezl'
            file_out = f'out01_c/c{str(i)}.out'
        runTester(file_in, file_out)

    print("\nTeste LEXERR:")
    for i in range(1,4):
        file_in = f'in/lexerr0{i}.ezl'
        file_out = f'out01_c/lexerr0{str(i)}.out'
        runTester(file_in, file_out)

    print("\nTeste SEMERR:")
    for i in range(1,9):
        file_in = f'in/semerr0{i}.ezl'
        file_out = f'out01_c/semerr0{str(i)}.out'
        runTester(file_in, file_out)

    print("\nTeste SYNERR:")
    for i in range(1,4):
        file_in = f'in/synerr0{i}.ezl'
        file_out = f'out01_c/synerr0{str(i)}.out'
        runTester(file_in, file_out)

    

