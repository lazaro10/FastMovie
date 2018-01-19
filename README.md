## Installation

Este projeto faz uso do [CocoaPods](https://cocoapods.org). Tudo o que você precisa para configurá-lo corretamente é:

```
pod install
```

## Open Project

Para abrir o projeto use:
```
open FastMovie.xcworkspace
```

## Projeto
O aplicativo consiste em um catálogo de filmes onde o usuário pode escolher os filmes por categoria desejada e pode visualizar os detalhes do filme.

O projeto foi todo desenvolvido em swift 4, para iOS 11.0 ou superior, foi utilizada a arquitetura VIPER com orientação a objeto - SOLID.
Para os serviços de network foi utilizado o framework [Alamofire](https://github.com/Alamofire/Alamofire), e para download de imagens foi utilizado o [Kingfisher](https://github.com/onevcat/Kingfisher).
O padrão de projeto Coordinator foi utilizado para transição de telas e o padrão Factory para criação de objetos,  na camada de visão foi utilizado o [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD) para apresentação dos feedbacks de loading.

Para especificação das classes de testes foram utilizados o [Quick](https://github.com/Quick/Quick) e o [Nimble](https://github.com/Quick/Nimble) e para interrupções de chamadas HTTP foi utilizado o [OHHTTPStubs/Swift](https://github.com/AliSoftware/OHHTTPStubs)
