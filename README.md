# Sistema de Processamento de Dados de Sensores

Este projeto foi desenvolvido como parte de um trabalho prático da disciplina **Sistemas Digitais**, do **7º período do curso de Engenharia de Computação**. Seu objetivo é implementar um sistema de processamento de dados de sensores para um ambiente de controle industrial, utilizando **Verilog HDL**. O sistema recebe dados de múltiplos sensores, envia pacotes de dados através de um canal de comunicação e realiza a verificação de integridade dos dados por meio de bits de paridade. Além disso, emprega multiplexadores e demultiplexadores para organizar os dados e endereçar os sensores de forma sequencial.

## Descrição do Sistema

O sistema foi projetado para controlar e monitorar dados de 8 sensores em um sistema industrial. Cada sensor transmite um pacote de 8 bits de dados, e o sistema implementa a seguinte estrutura:

- **Multiplexação de sensores**: Utiliza um multiplexador de 8 entradas para selecionar qual sensor irá enviar dados em um determinado momento.
- **Endereçamento sequencial**: Cada sensor é identificado por um endereço de 3 bits, permitindo uma transmissão ordenada dos dados.
- **Cálculo e verificação de paridade**: O sistema gera e verifica um bit de paridade para garantir a integridade dos dados transmitidos.

Cada pacote transmitido contém 11 bits:
- 8 bits de dados do sensor.
- 3 bits de endereço sequencial.
- 1 bit de paridade para verificação de integridade.

### Módulos do Sistema

#### 1. **sensor_system** (Módulo Principal)
- **Função**: Este é o módulo principal que coordena a operação do sistema, incluindo a geração de endereços, a multiplexação dos dados, a verificação de paridade e a transmissão do pacote.
  
#### 2. **mux_8to1** (Multiplexador)
- **Função**: Seleciona um dos 8 sensores de acordo com o endereço fornecido.

#### 3. **parity_generator** (Gerador de Paridade)
- **Função**: Calcula o bit de paridade para os dados de 8 bits do sensor.

#### 4. **packet_transmitter** (Transmissor de Pacotes)
- **Função**: Concatena os dados do sensor, o bit de paridade e o endereço sequencial para formar um pacote de 11 bits.

#### 5. **demux_1to8** (Demultiplexador)
- **Função**: Recebe o pacote transmitido e distribui os dados para o sensor correspondente, com base no endereço.

#### 6. **parity_checker** (Verificador de Paridade)
- **Função**: Verifica se o pacote recebido possui a paridade correta, indicando erro de transmissão se necessário.

## Ferramentas Utilizadas
- **Verilog HDL**: Linguagem de descrição de hardware utilizada para implementação dos módulos digitais.
- **ModelSim**: Ferramenta para simulação e verificação do funcionamento do sistema.
- **Intel Quartus Prime** (v. 18.1): Ferramenta utilizada para a compilação do código Verilog.
