/*var perguntas = [['2+2','1',  4
                  '9*9','2',  81
                  '7*9','3',  63
                  '6/3','4',  2
                  'x^2*4x+9','5',   4x^3+9
                  '3x^2-18x+24 = 0','6',  6
                  '(33+7x)x^2','7',   33x^2+7x^3
                  'x^2-(44*3)7 ,'8',  x^2-924
                  'Quantas soluções inteiras a inequação x² + x - 20 ≤ 0 admite? ,'9',    10
                  'A soma dos números inteiros x que satisfazem 2x + 1 ≤ x +3 ≤ 4x é '10',    3
                  'Sejam x e y números tais que os conjuntos {0, 7, 1} e {x, y, 1} são iguais. Então, podemos afirmar que: ,'11',   X+Y = 7
                  'x – y = 2 e x2 + y2 = 8, então x3 – y3 é igual a: ,'12',   20
                  'Se x + y = 13 e x · y = 1, então x2 + y2 é: ,'13',   167
                  'Se cos 2θ = 7/25 e θ pertence ao primeiro quadrante, então cos θ é igual a:,'14',  4/5
                  'João recebeu um aumento de 10% e com isso seu salário chegou a R$1.320,00. O salário de João antes do aumento era igual a? ,'15',  1200 reais
                  'Sendo A o ponto da reta 2x + y −1 = 0 que equidista dos pontos B = (1,1) e C = (0,−1) , e sendo D = (0,1) , a área do triângulo ACD vale,'16', 1/2
                  'O número de soluções da equação  , com x > 0, é igual a:,'17', 1
                  'O número de soluções da equação x=√6-x , com x > 0, é igual a:,'18', 1
                  'A soma dos inversos das raízes da equação x² -10x + 22 = 0 é igual a:,'19',  5/11
                  'A soma de todas as frações da forma n/(n+1), onde n é um elemento do conjunto {1, 2, 3, 4, 5}, é ,'20',  3,55
                  'Quatro moedas são lançadas simultaneamente. Qual é a probabilidade de ocorrer coroa em uma só moeda?,'21', 2/9
                  'Jogamos dois dados comuns. Qual a probabilidade de que o total de pontos seja igual a 10?,'22',  1/12
                  'A probabilidade de um casal com quatro filhos ter dois do sexo masculino e dois do sexo feminino é: ,'23', 37,5%
                  'A probabilidade de um dos cem números 1, 2, 3, 4, ..., 100 ser múltiplo de 6 e de 10 ao mesmo tempo é:,'24', 3%
                  'Sendo x um arco do segundo quadrante tal que sen x = 3/7 , o valor de tgx é:,'25', -(3 √10)/20
                  'A soma de todos os números naturais ímpares de 3 algarismos é:,'26', 247.500
                  'Quantos termos a soma 5+ 7+ 9+ 11+⋯ deve ter para que o total seja 2700 ?,'27',  50
                  'A média aritmética das raízes da equação modular |2x – 4|  + |x + 1| = 4 é igual a:,'28', 5/3
                  'Para que o polinômio P(x) = x5 - 2x4 + kx3 - 3x2 + 6 seja divisível pelo binômio -x + 1, o valor de k deve ser igual a:,'29',  -2
                  'Considerando-se os algarismos significativos dos números 28,7 e 1,03, podemos afirmar que a soma destes números é dada por:,'30',  29,7
                  'Seja A uma matriz invertível de ordem 3 tal que a matriz A5+ 2A4 é a matriz nula. O determinante de A é: ,'31',    -8
                  'Considere a equação x² + 12x + k = 0. Para qual valor de k esta equação NÃO possui raízes inteiras? ,'32',   34
                ]]
var resposta = '';
var jogoContinua; // <- boolean que define se o jogador morreu ou nao no jogo.  true -> vivo      false -> morto
/*do jeito que eu estou montando, vai ter um array com as perguntas e respostas, e uma funcao para cada "coisa"
se tiver uma ideia melhor de como fazer isso estou ouvindo, pois a maneira que estou fazendo me parece relativamente preguicosa
function round1() { 
    var pergunta = Math.floor(Math.random() * 11);
    if (resposta = perguntas[pergunta][1]) {
        jogoContinua = true
        checkVivo()
    }
    else {
        jogoContinua = false
        checkVivo()
    }
}
function checkVivo() { // <- funcao que vai checar se o jogador esta vivo ou nao e mudar o jogo de acordo com o estado do jogador  
    if (jogoContinua == true) {
        // nao sei oq botar aqui ainda
    }
    else if (jogoContinua == false) {
        fimDeJogo()
    }
}

function fimDeJogo(){ //<- funcao que vai declarar o fim de jogo ao jogador e chamar a funcao de reinicio de jogo

}

function reiniciaJogo(){ // <- funcao que vai reiniciar o jogo

}*/

const InstrucaoBotao = document.getElementById("botaoinstrucoes"); // botao de instrucoes
const iniciobotao = document.getElementById("botaoiniciar"); // botao que inicia o jogo
const Temporizador = document.getElementById("temporizador"); // temporizador
const Comentarios = document.getElementById("comentarios"); // comentarios no html
const ContadorDeVidas = document.querySelector(".contador-de-vidas"); // conta vidas
const Jogador = document.querySelector(".iconejogador"); // icone do jogador que ainda precisa ser implementado
const bodydojogo = document.querySelector(".bodydojogo"); // corpo do jogo, classe do css
const vidro = document.querySelectorAll(".vidro"); // opcoes, os "vidros" da serie
const PosicaoInicial = document.querySelector(".posicaoinicial"); // posicao inicial
const PosicaoFinal = document.querySelector(".posicaofinal"); // ultima posicao
const AsseguraPosicao = document.querySelector(".posicaosegurada"); // <-- segura a ultima posicao registrada
const telagameover = document.getElementById("displaygameover"); // tela de game over
const textogameover = document.getElementById("disptextogameover"); // texto de game over
const botaoreiniciar = document.getElementById("botaoreiniciar"); // botao que reinicia o game
const fim = document.getElementById("fim");

// desliga ou liga a musica
const musicatema = document.getElementById("musicatema"); // musica tema do squid game?

const perguntas = ['2+2',
'9*9'
,'7*9'
,'6/3'
,'x^2*4x+9'
,'3x^2-18x+24 = 0'
,'(33+7x)x^2'
,'x^2-(44*3)7',
'Quantas soluções inteiras a inequação x² + x - 20 ≤ 0 admite?',
'A soma dos números inteiros x que satisfazem 2x + 1 ≤ x +3 ≤ 4x é',
'Sejam x e y números tais que os conjuntos {0, 7, 1} e {x, y, 1} são iguais. Então, podemos afirmar que:',
'x – y = 2 e x2 + y2 = 8, então x3 – y3 é igual a:','Se x + y = 13 e x · y = 1, então x2 + y2 é',
'Se cos 2θ = 7/25 e θ pertence ao primeiro quadrante, então cos θ é igual a:',
'João recebeu um aumento de 10% e com isso seu salário chegou a R$1.320,00. O salário de João antes do aumento era igual a?',
'Sendo A o ponto da reta 2x + y − 1 = 0 que equidista dos pontos B = (1,1) e C = (0,−1) , e sendo D = (0,1) , a área do triângulo ACD vale',
'O número de soluções da equação  , com x > 0, é igual a:',
'O número de soluções da equação x=√6-x , com x > 0, é igual a:',
'A soma dos inversos das raízes da equação x² -10x + 22 = 0 é igual a:',
'A soma de todas as frações da forma n/(n+1), onde n é um elemento do conjunto {1, 2, 3, 4, 5}, é ',
'Quatro moedas são lançadas simultaneamente. Qual é a probabilidade de ocorrer coroa em uma só moeda?',
'Jogamos dois dados comuns. Qual a probabilidade de que o total de pontos seja igual a 10?',
'A probabilidade de um casal com quatro filhos ter dois do sexo masculino e dois do sexo feminino é:',
'A probabilidade de um dos cem números 1, 2, 3, 4, ..., 100 ser múltiplo de 6 e de 10 ao mesmo tempo é:',
'Sendo x um arco do segundo quadrante tal que sen x = 3/7 , o valor de tgx é:',
'A soma de todos os números naturais ímpares de 3 algarismos é:',
'Quantos termos a soma 5+ 7+ 9+ 11+⋯ deve ter para que o total seja 2700 ?',
'A média aritmética das raízes da equação modular |2x – 4|  + |x + 1| = 4 é igual a:',
'Para que o polinômio P(x) = x5 - 2x4 + kx3 - 3x2 + 6 seja divisível pelo binômio -x + 1, o valor de k deve ser igual a:',
'Considerando-se os algarismos significativos dos números 28,7 e 1,03, podemos afirmar que a soma destes números é dada por:',
'Seja A uma matriz invertível de ordem 3 tal que a matriz A5+ 2A4 é a matriz nula. O determinante de A é: ',
'Considere a equação x² + 12x + k = 0. Para qual valor de k esta equação NÃO possui raízes inteiras?'];
const respostas = ['4','81','63','2','4x^3+9','6','33x^2+7x^3','x^2-924','10','3','X+Y = 7','20','167','4/5','1200 reais','1/2',
'1','1','5/11','3,55','2/9','1/12','37,5%','3%','-(3 √10)/20','247.500','50','5/3','-2','29,7','-8','34'];
const respostaserradas = ['6','67','83','4','2x^3+5','3','27x^2+5x^3','x^2-726','7','1','X+Y = 9','10','228','3/6','1500 reais','2','5','0',
'3/11','2,75','6/11','7/14','26,5%','7%','-(3 √9)/15','375.900','20','9/3','-4','31,6','-13','44'];

let Tempo = 300; // tempo para responder as pergunta
let iniciajogo = false;
let totaldevidas = 6; // numero total de vidas
let perdervidroaleatoriamente = [];
let perdervida = false;
let vidroanteriorlimpo = true;
let proximovidro;
let iconejogador;
let i = 1;
let gameover = false; // perda total de vidas ocasiona nisso
let intervalo;

let displayPerguntas = [];

// CONFIGURANDO OS VIDROS
const vidroArray = {
  1: [1, 2],
  2: [3, 4],
  3: [5, 6],
  4: [7, 8],
  5: [9, 10],
  6: [11, 12],
  7: [13, 14],
};

function perguntasselect() {
  let contador = 0;
  var perguntatemporario = 0;
  //console.log(perguntatemporario);
  while (contador < 8) {
    displayPerguntas[contador] = perguntas[contador + perguntatemporario]; 
    console.log(displayPerguntas[contador]);

    contador++;
  }
  document.getElementById("pergunta").innerHTML = displayPerguntas[0]; 
}

function perguntaAtual(){
  document.getElementById("pergunta").innerHTML = displayPerguntas[i];
  
}


// instrução para notificação do botão
function instructions() {
  alert(
    "Os jogadores terão de cruzar duas pontes paralelas saltando sobre paineis de vidro, para que possam saber onde pular, calculos matematicos serão perguntados ao jogador e a resposta estará no vidro resistente onde o jogador proseguira para proxima fase, caso erre o jogador tem mais 3 vidas."
  );
}

InstrucaoBotao.addEventListener("click", instructions);

//Controle de botão iniciar 
iniciobotao.addEventListener("click" ,() => {
  iniciajogo = true;
  intervalo = setInterval(() => {
    if (Tempo > 0) {
      Tempo--;
      Temporizador.innerText = `Tempo : ${Tempo}sec`;
      if (Tempo == 0) {
        gameOver();
      }
    }
  }, 1000);
}, perguntasselect());

//gerando peças perdidas aleatórias para o jogo
perdervidroaleatoriamente = geravidrosaleatorios(vidroArray);

//computador gerando números de blocos aleatórios para perder
function geravidrosaleatorios(vidroArray) {
  /*let Telha = [];
  for (const set in vidroArray) {
    Telha.push(getRandom(vidroArray[set][0], vidroArray[set][1]));

  }
  */
  Telha = [2,4,5,7,9,12,14];
  console.log(Telha);
  return Telha;
  
}


// quando o jogo começar
vidro.forEach((Telha) => {
  Telha.addEventListener("click", () => {
    // checando se o botao iniciajogo foi apertado
    if (!iniciajogo) {
      // retorna (Comentarios.innerHTML = "Por favor inicie o botão iniciar!");
      alert("Pressione primeiro o botao iniciar!");
    }

    // verificar se o conjunto de vidros anterior foi apagado
    if (
      vidroArray[i][0] == Telha.dataset.value ||
      vidroArray[i][1] == Telha.dataset.value
    ) {
      // console.log("Limpo");

      vidroanteriorlimpo = true;

      //removendo o ícone do Jogador do vidro anterior
      if (i != 1) proximovidro.removeChild(Jogador);
      // Verificando se é um vidro errado
      perdervidroaleatoriamente.forEach((lostTelha) => {
        if (Telha.dataset.value == lostTelha) {
          perdervida = true;

          // DEBUG console.log("vidas - 1");
        }
      }); perguntaAtual();
      return;
    }
    if (Telha.dataset.value) {
      alert("Selecione todas as respostas certas em sequencia!");
      vidroanteriorlimpo = false;
      return;
    }

    //
  });
});

vidro.forEach((Telha) => {
  Telha.addEventListener("click", () => {
    //verificando se o botão iniciajogo foi pressionado
    if (!iniciajogo) return;
    if (!vidroanteriorlimpo) return;
    if (perdervida) {
      Comentarios.innerText = "Você perdeu uma vida!";
      Telha.style.backgroundColor = "black";
      PosicaoInicial.appendChild(Jogador);
      i = 1;
      totaldevidas--;
      document.getElementById("pergunta").innerHTML = displayPerguntas[0]; 
      ContadorDeVidas.innerText = `Vidas restantes : ${totaldevidas}`;

      perdervida = false; //Resetando o perdervida
      Telha.dataset.value = null;

      //checando se o total de vidas é 0
      if (totaldevidas <= 0) {
        // console.log("gameover");
        gameOver();
      }
      //
    } else {
      //se o jogador pisa no vidro certo, então i++
      i++;
      moveJogador(Telha);
      //   console.log("ir em frente");
      Comentarios.innerText = "Siga em frente!";
    }
    // console.log(Telha);
  });
});

// randomizar cada conjunto de vidros
function getRandom(min, max) {
  max++; //uma vez que o valor máximo não está incluído
  return Math.floor(Math.random() * (max - min)) + min;
}
// console.log(getAleatorio());

// Jogador se movendo para o próximo conjunto de vidro
function moveJogador(Telha) {
  Telha.appendChild(Jogador);
  proximovidro = Telha;
}

// detecta condicao de vitoria de jogo
PosicaoFinal.addEventListener("click", () => {
  if (i >= 7) {
    venceu();
    PosicaoFinal.removeChild(AsseguraPosicao);
    PosicaoFinal.appendChild(Jogador);
  }
});
//


function gameOver() {
  bodydojogo.classList.add("hide");
  telagameover.classList.remove("hide");
  disptextogameover.classList.remove("hide");
  clearInterval(intervalo);
}

function venceu() {
  bodydojogo.classList.add("hide");
  telagameover.classList.remove("hide");
  textogameover.classList.remove("hide");
  textogameover.style.color = "white";
  textogameover.innerText = "Você ganhou! Parabens!  Aperte F5 para jogar novamente!";

}

fim.addEventListener("click", venceu);