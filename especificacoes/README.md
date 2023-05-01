# Especificação do Projeto

## Diagrama de Objetivos

![Diagrama de Objetivos: controle de mesas](images/objetivos-controle-mesas.png)

![Diagrama de Objetivos: controle de mesas](images/objetivos-controle-pedidos.png)

## Diagrama Entidade Relacionamento

![Diagrama de Objetivos: controle de mesas](images/diagrama-entidade-relacionamento.jpg)


## Modelo Relacional

````MySQL

Mesa(numero, area, QTDMaxOcupantes)
Pagamento(IDPagamento, desconto, tipoPagamento)
Pedido(IDPedido, numeroFK, IDpagamentoFK, data)

ReservaMesa(numeroFK, IDReservaFK)
Reserva(IDReserva, nomeCliente, data, hora, QTDOcupantes)


PedidoPrato(IDPedidoFK, IDPratoFK, data, quantidade)
Prato(IDPrato, nome, preco, tipo)

ProdutoPrato(IDPratoFK, IDProdutoFK)
Produto(IDProduto, nome, preco, fornecedor)

````