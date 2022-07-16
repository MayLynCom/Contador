//quando você roda o MaterialApp automaticamente esse pacote é importado onde contem todos os parametros
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
//quando você roda o runapp automaticamente esse pacote é importado onde contem todos os widgets de design
import 'package:flutter/material.dart';

void main() {
  //runApp = roda o app

  //Container = uma caixa customizavel
  runApp(const MyApp()); //utilizar o const com coisas que n mudam, são fixas
}

//atalho steless e tab
class MyApp extends StatelessWidget {
  //criando um widget customizado e ele se chama MyApp
  const MyApp({Key? key}) : super(key: key); //construtor

  @override
  Widget build(BuildContext context) {
    //Função que retorna um widget se chama build, recebe como parametro um buildContext
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //MaterialApp onde tem todos os parametros
      home: HomePage(),
    );
  }
}

//atalho stfull
class HomePage extends StatefulWidget {
  //widget com estado alteravel
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      //a tela atualiza na hora que decrementar, usando o build reconstruindo a tela
      count--;
    });
    // ignore: avoid_print
  }

  void increment() {
    setState(() {
      //o build atualiza na hora que incrementar
      count++;
    });
    // ignore: avoid_print
  }

  bool get isEmpty => count == 0; // se count igual a 20 isEmpty, atribuiu para boleano pois isso pode ser true ou false
  bool get isFull => count == 20; //se count igual a 20 isFull, atribuiu para boleano pois isso pode ser true ou false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  //colocar imagem de fundo
                  image: AssetImage(
                      "assets/images/image.jpg"), //NetworkImage("http//www.google.com/image/fdfdfdfd") colocar uma imagem da net
                  fit: BoxFit
                      .cover //redimencionar a altura imagem, se quiser a largura mudar pra weight, .fill estica a imagem, .cover cobre o espaço total da tela sem distorcer a imagem
                  )),
          child: Column(
            //vertical
            mainAxisAlignment: MainAxisAlignment
                .center, //alinhamento do eixo principal, ou seja, ela coloca os componentes verticalmente alinhados
            children: [
              Text(
                isFull
                    ? "Lotado"
                    : "Pode Entrar !", //se for  = a 20 ira exibir lotado se n pode entrar
                style: TextStyle(
                  //estilização do texto
                  fontSize: 40,
                  color: isFull
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700, //grossura da font
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "$count", //ou utilizar count.ToString para tornar um inteiro em texto
                  style: const TextStyle(
                    fontSize: 100,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //horizontal
                children: [
                  TextButton(
                    onPressed: isEmpty
                        ? null
                        : decrement, //se count = 0  onpressed = null ou seja ele desabilita
                    style: TextButton.styleFrom(
                      //estilo do botão
                      backgroundColor: isEmpty
                          ? const Color.fromARGB(63, 0, 0, 0)
                          : const Color.fromARGB(
                              255, 0, 0, 0), //cor de fundo do botão
                      fixedSize: const Size(100, 100),
                      primary: const Color.fromARGB(255, 255, 255,
                          255), //mudando a cor quando for clicar no botão
                      shape: RoundedRectangleBorder(
                          //com ele você modifica a boderside = colocar uma borda, e border radius = modifica a borda
                          borderRadius: BorderRadius.circular(24)),
                      //padding: const EdgeInsets.all(32), //espaçamento dentro do botão em todos os lados
                      // caso queira só um lado usar = EdgeInsets.only(left: 32)
                      // caso queira expecificar cada lado usar = EdgeInsets.fromLTRB(left, top, right, bottom)
                    ),
                    child: const Text(
                      "Saiu!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                      width:
                          32), //widget invisivel sizedbox serve para afastar outros widgets
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isFull
                          ? const Color.fromARGB(63, 0, 0, 0)
                          : const Color.fromARGB(255, 0, 0, 0),
                      fixedSize: const Size(100,
                          100), //tamanho fixo para o botão para n ficar desigual por causa do texto
                      primary: const Color.fromARGB(255, 255, 247, 247),
                      shape: RoundedRectangleBorder(
                          //com ele você modifica a boderside = colocar uma borda, e border radius = modifica a borda
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: isFull ? null : increment,
                    child: const Text(
                      "Entrou!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

/*
class HomePage extends StatelessWidget {//widget sem estado ou seja ele n muda, permanece do jeito que ele é até morrer
   HomePage({Key? key}) : super(key: key);

  
}
*/
